class Album < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'albums_users'
  has_and_belongs_to_many :stickers, join_table: 'albums_stickers'

end
