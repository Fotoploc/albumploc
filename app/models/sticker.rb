class Sticker < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'stickers_users'
  belongs_to :album
end
