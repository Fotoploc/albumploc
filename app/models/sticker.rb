class Sticker < ApplicationRecord
  has_many :users, class_name: 'UserSticker', foreign_key: 'sticker_id'
  has_and_belongs_to_many :exchanges, join_table: 'exchanges_stickers'
  has_many :sender_stickers, class_name: 'SenderSticker', foreign_key: 'sticker_id'
  has_many :receiver_stickers, class_name: 'ReceiverSticker', foreign_key: 'sticker_id'
  belongs_to :album
end
