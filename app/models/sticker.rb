class Sticker < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'stickers_users'
  has_and_belongs_to_many :albums, join_table: 'albums_stickers'
end
