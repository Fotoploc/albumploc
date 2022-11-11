class CreateAlbumsStickersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :albums, :stickers do |t|
      t.index :album_id
      t.index :sticker_id
    end
  end
end
