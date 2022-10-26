json.extract! sticker, :id, :code, :description, :picture, :created_at, :updated_at
json.url sticker_url(sticker, format: :json)
