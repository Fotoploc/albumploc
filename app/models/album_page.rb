class AlbumPage < ApplicationRecord
  mount_uploader :background_image, AlbumPageBackgroundImageUploader

  belongs_to :album
  has_many :stickers, class_name: 'PageSticker', foreign_key: 'album_page_id'

  validates :page_number, presence: true, uniqueness: { scope: :album_id }

end
