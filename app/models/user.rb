class User < ApplicationRecord
  has_and_belongs_to_many :albums, join_table: 'albums_users'
  has_many :stickers, class_name: 'UserSticker', foreign_key: 'user_id'
  # has_many :exchanges, foreign_key: 'sender_id'
  # has_many :exchanges, foreign_key: 'receiver_id'
  has_many :sent_exchanges, class_name: 'Exchange', foreign_key: 'sender_id'
  has_many :received_exchanges, class_name: 'Exchange', foreign_key: 'receiver_id'
  has_one :permission, class_name: 'Permission', foreign_key: 'user_id'
  
  has_many :stickers_packs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  after_create :set_permission
  after_create :set_code
  before_save :set_album

  def set_permission
    Permission.create(user_id: self.id)
  end

  def set_code
    self.albums << Album.where(code: self.code)
  end

  def set_album
    if self.code.nil? || self.code == ''
      self.albums << Album.where(code: self.code)
      album = Album.find_by(code: self.code.to_i)
      album.users << self
      album.save
    end
  end

  def admin?
    self.permission.is_admin
  end
  
end
