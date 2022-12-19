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
  after_create :set_stickers_packs
  #before_save :set_album

  def set_permission
    Permission.create(user_id: self.id)
  end

  def set_code
    self.albums << Album.where(code: self.code)
  end

  def set_album
    if self.code.nil? || self.code == ''
      p "Usuário sem Código"
    else
      self.albums << Album.where(code: self.code)
    end
  end

  def set_stickers_packs
      album = Album.find_by(code: self.code)
      self.stickers_packs.new(album_id: album.id, quantity: 15).save
  end

  def admin?
    self.permission.is_admin
  end
  
end
