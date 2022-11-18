class CreateExchangesStickersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :exchanges, :stickers do |t|
      t.index :exchange_id
      t.index :sticker_id
    end
  end
end
