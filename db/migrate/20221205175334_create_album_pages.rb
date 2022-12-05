class CreateAlbumPages < ActiveRecord::Migration[7.0]
  def change
    create_table :album_pages do |t|
      t.references :album, null: false, foreign_key: true
      t.integer :page_number, null: false
      t.string :background_image, null: false
      t.timestamps
    end
  end
end
