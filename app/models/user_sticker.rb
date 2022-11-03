class User_sticker < ApplicationRecord
  belongs_to :user
  belongs_to :sticker
end