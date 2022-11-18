class Sticker < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'stickers_users'
  has_and_belongs_to_many :exchanges, join_table: 'stickers_exchanges'
  belongs_to :album
end
