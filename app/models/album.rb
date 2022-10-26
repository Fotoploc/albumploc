class Album < ApplicationRecord
  has_and_belongs_to_many :user
  has_many :stickers
end
