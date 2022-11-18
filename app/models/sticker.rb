class Sticker < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'stickers_users'
  has_and_belongs_to_many :exchanges, join_table: 'exchanges_stickers'
  has_many :sender_stickers, class_name: 'SenderSticker', foreign_key: 's_sticker_id'
  has_many :receiver_stickers, class_name: 'ReceiverSticker', foreign_key: 'r_sticker_id'
  belongs_to :album
end
