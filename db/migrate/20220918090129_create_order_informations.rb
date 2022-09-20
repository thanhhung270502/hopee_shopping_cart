class CreateOrderInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :order_informations do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
