class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :shop
      t.string :name
      t.string :color
      t.integer :price
      t.integer :total_quantity, default: 0
      t.boolean :status, default: false
      t.text :description 
      t.text :product_information
      t.boolean :hot_product
      
      t.timestamps
    end
  end
end
