class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :code
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
