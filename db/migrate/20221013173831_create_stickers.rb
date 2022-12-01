class CreateStickers < ActiveRecord::Migration[7.0]
  def change
    create_table :stickers do |t|
      t.string :code
      t.text :description
      t.string :picture
      t.boolean :is_active, default: true
      t.references :album, null: false, foreign_key: true
      t.timestamps
    end
  end
end
