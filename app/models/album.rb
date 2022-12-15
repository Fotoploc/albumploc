class Album < ApplicationRecord
  mount_uploader :picture, AlbumPictureUploader

  has_and_belongs_to_many :users, join_table: 'albums_users'
  has_many :stickers
  has_many :album_page
  has_many :stickers_packs
end