class CreateCartSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_sessions do |t|
      t.references :user
      t.decimal :sum_money, default: 0
      # t.boolean :voucher_status, default: false
      # t.decimal :total_final, default: 0

      t.timestamps
    end
  end
end
