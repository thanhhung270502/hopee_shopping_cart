class CreateReviewSuggests < ActiveRecord::Migration[7.0]
  def change
    create_table :review_suggests do |t|
      t.references :review 
      t.references :suggest
      
      t.timestamps
    end
  end
end
