class Exchange < ActiveRecord::Base
  has_and_belongs_to_many :stickers, join_table: 'exchanges_stickers'
  has_many :sender_stickers, dependent: :destroy
  has_many :receiver_stickers, dependent: :destroy
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
end
