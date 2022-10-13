class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.integer :code
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
