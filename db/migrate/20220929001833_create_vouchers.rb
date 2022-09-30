class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.string :name
      t.integer :code
      t.integer :quantity
      t.integer :type_voucher
      t.integer :discount
      t.decimal :condition  
      t.decimal :discount_max

      t.timestamps
    end
  end
end
