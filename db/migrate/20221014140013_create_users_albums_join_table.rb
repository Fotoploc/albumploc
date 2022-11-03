class CreateUsersAlbumsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :albums do |t|
      t.index :user_id
      t.index :album_id
    end
  end
end
