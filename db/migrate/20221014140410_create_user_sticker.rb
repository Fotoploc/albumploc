class CreateUserSticker  < ActiveRecord::Migration[7.0]
  def change
    create_table :user_stickers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sticker, null: false, foreign_key: true
      t.boolean :is_active, default: true
      t.boolean :is_favorite, default: false
      t.boolean :is_open_to_trade, default: false
      t.timestamps
    end
  end
end
