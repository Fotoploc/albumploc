class ReceiverSticker < ActiveRecord::Base
  belongs_to :exchange
  belongs_to :sticker, class_name: 'Sticker', foreign_key: 'sticker_id'
end
