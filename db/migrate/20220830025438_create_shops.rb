class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string  :name, null: false
      t.references :user
      t.text :description
      t.string :avatar

      t.timestamps
    end
  end
end
