class CreateUsersStickersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :stickers do |t|
      t.index :user_id
      t.index :sticker_id
    end
  end
end
