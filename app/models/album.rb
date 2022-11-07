class Album < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'user_albums'
end
