class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.references :user
      t.string  :name, null: false
      t.text :description
      t.string :web_url 
      t.string :image

      t.timestamps
    end
  end
end
