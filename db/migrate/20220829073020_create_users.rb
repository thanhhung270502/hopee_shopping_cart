class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.string :address
      t.string :password_digest
      t.string :web_url
      t.string :cover_color
      t.string :image
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
