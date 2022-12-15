class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.integer :code
      t.text :description
      t.string :picture
      # default: 'https://res.cloudinary.com/dzjxjxjxj/image/upload/v1623620000/album_default_picture.png'
      t.timestamps
    end
  end
end
