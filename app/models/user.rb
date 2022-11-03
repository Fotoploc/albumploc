class User < ApplicationRecord
  has_and_belongs_to_many :stickers, join_table: 'user_stickers'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  # validate :passwords_match

  # def passwords_match
  #   return if password == password_confirmation

  #   errors.add :password_confirmation, 'Passwords do not match'
  # end
end
