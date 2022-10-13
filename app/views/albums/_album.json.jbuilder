json.extract! album, :id, :name, :code, :description, :picture, :created_at, :updated_at
json.url album_url(album, format: :json)
