class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :shop
      t.string :name
      t.string :color
      t.integer :price
      t.text :description 
      t.boolean :hot
      
      t.timestamps
    end
  end
end
