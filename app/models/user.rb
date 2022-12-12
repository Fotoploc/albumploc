class User < ApplicationRecord
  has_and_belongs_to_many :albums, join_table: 'albums_users'
  has_many :stickers, class_name: 'UserSticker', foreign_key: 'user_id'
  # has_many :exchanges, foreign_key: 'sender_id'
  # has_many :exchanges, foreign_key: 'receiver_id'
  has_many :sent_exchanges, class_name: 'Exchange', foreign_key: 'sender_id'
  has_many :received_exchanges, class_name: 'Exchange', foreign_key: 'receiver_id'
  has_one :permission, class_name: 'Permission', foreign_key: 'user_id'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  after_create :set_permission
  
  def set_permission
    Permission.create(user_id: self.id)
  end
  def admin?
    self.permission.is_admin
  end
end
