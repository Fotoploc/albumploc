class CreateStickers < ActiveRecord::Migration[7.0]
  def change
    create_table :stickers do |t|
      t.string :code
      t.text :description
      t.string :picture
      t.boolean :is_active, default: true
      t.boolean :is_favorite, default: false
      t.boolean :is_open_to_trade, default: false
      t.references :album, null: false, foreign_key: true
      t.timestamps
    end
  end
end
