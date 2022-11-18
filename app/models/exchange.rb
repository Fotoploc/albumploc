class Exchange < ActiveRecord::Base
  has_and_belongs_to_many :stickers, join_table: 'stickers_exchanges'
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
end
