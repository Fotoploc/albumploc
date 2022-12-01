class CreateReceiverSticker < ActiveRecord::Migration[7.0]
  def change
    create_table :receiver_stickers do |t|
      t.references :exchange, null: false, foreign_key: true
      t.references :sticker
      t.timestamps
    end
    add_foreign_key :receiver_stickers, :stickers, column: :sticker_id, primary_key: :id
  end
end
