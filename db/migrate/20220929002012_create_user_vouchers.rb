class CreateUserVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_vouchers do |t|
      t.references :user
      t.references :voucher

      t.timestamps
    end
  end
end
