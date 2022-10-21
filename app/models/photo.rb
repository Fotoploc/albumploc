class Photo < ApplicationRecord
  belongs_to :albums
  has_and_belongs_to_many :users
end
