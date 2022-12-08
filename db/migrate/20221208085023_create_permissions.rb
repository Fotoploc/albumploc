class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :is_admin, default: false
      t.timestamps
    end
  end
end
