class CreateTransports < ActiveRecord::Migration[7.0]
  def change
    create_table :transports do |t|
      t.references :order_information, null: false, foreign_key: true
      t.integer :transport_type
      t.string :content

      t.timestamps
    end
    add_index :transports, [:order_information_id, :created_at]
  end
end
