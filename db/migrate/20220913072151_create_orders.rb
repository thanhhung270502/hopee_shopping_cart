class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.decimal :sum_money
      
      t.timestamps
    end
  end
end
