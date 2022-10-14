class CreateAlbumsPhotosJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :users do |t|
      t.index :photo_id
      t.index :album_id
    end
  end
end
