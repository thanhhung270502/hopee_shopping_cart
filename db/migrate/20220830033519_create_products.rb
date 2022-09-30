class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :shop
      t.string :name
      t.string :color
      t.decimal :price
      t.integer :discount, default: 0
      t.decimal :current_price
      t.integer :type_product, null: false
      t.integer :total_quantity, default: 0
      t.boolean :status, default: false
      t.text :description 
      t.text :product_information
      t.boolean :hot_product
      t.boolean :destroy_product, default: false
      
      t.timestamps
    end
  end
end
