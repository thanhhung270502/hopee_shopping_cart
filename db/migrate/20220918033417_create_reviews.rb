class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :product
      t.integer :star
      t.text :content

      t.timestamps
    end
  end
end
