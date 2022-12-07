class PageSticker < ApplicationRecord
  has_many :stickers, class_name: 'Stickers', foreign_key: 'sticker_id'
end
