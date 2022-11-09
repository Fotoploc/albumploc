class User < ApplicationRecord
  has_and_belongs_to_many :stickers, join_table: 'stickers_users'
  has_and_belongs_to_many :albums, join_table: 'albums_users'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

end
