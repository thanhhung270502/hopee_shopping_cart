class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.decimal :sum_money
      t.integer :discount
      t.decimal :total_final
      
      t.timestamps
    end
  end
end
