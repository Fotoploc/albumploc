class CreateTransaction < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :sender
      t.references :receiver
      t.string :status
    end
    add_foreign_key :transactions, :users, column: :sender_id, primary_key: :id
    add_foreign_key :transactions, :users, column: :receiver_id, primary_key: :id
  end
end
