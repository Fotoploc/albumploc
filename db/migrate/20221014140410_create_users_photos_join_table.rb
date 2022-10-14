class CreateUsersPhotosJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :users do |t|
      t.index :user_id
      t.index :photo_id
    end
  end
end
