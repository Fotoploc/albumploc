class SenderSticker < ApplicationRecord
  belongs_to :exchange
  belongs_to :s_sticker, class_name: 'Sticker', foreign_key: 's_sticker_id'
end
