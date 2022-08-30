class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :avatar, default: "https://i.pinimg.com/736x/16/b2/e2/16b2e2579118bf6fba3b56523583117f.jpg"
      t.string :phone
      t.string :address
      t.string :password_digest
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
