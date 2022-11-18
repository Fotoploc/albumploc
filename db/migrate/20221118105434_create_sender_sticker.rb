class CreateSenderSticker < ActiveRecord::Migration[7.0]
  def change
    create_table :sender_stickers do |t|
      t.references :exchange, null: false, foreign_key: true
      t.references :s_sticker
      t.timestamps
    end
    add_foreign_key :sender_stickers, :stickers, column: :s_sticker_id, primary_key: :id
  end
end
