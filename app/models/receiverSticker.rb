class ReceiverSticker < ActiveRecord::Base
  belongs_to :exchange
  belongs_to :r_sticker, class_name: 'Sticker', foreign_key: 'r_sticker_id'
end
