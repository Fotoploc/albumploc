class CreateUsersPhotosJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :photos, :users do |t|
      t.index :user_id
      t.index :photo_id
    end
  end
end
