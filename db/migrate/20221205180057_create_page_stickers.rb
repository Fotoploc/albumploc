class CreatePageStickers < ActiveRecord::Migration[7.0]
  def change
    create_table :page_stickers do |t|
      t.references :album_pages, null: false, foreign_key: true
      t.references :stickers, null: false, foreign_key: true
      t.float :position_x
      t.float :position_y
      t.float :rotation
      t.timestamps
    end
  end
end
