json.extract! photo, :id, :code, :description, :picture, :created_at, :updated_at
json.url photo_url(photo, format: :json)
