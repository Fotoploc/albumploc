class Album < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'albums_users'
  has_many :stickers
  has_many :album_page
end