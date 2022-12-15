class CreateStickersPacks < ActiveRecord::Migration[7.0]
  def change
    create_table :stickers_packs do |t|
      t.references :user, :album
      t.integer :quantity, default: 0
      t.timestamps
    end
  end
end
