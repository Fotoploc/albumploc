class Transaction < ActiveRecord::Base
  has_many :stickers
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
end
