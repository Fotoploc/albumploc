class CreateExchange < ActiveRecord::Migration[7.0]
  def change
    create_table :exchanges do |t|
      t.references :sender
      t.references :receiver
      t.string :status
    end
    add_foreign_key :exchanges, :users, column: :sender_id, primary_key: :id
    add_foreign_key :exchanges, :users, column: :receiver_id, primary_key: :id
  end
end
