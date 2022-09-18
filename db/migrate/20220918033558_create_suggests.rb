class CreateSuggests < ActiveRecord::Migration[7.0]
  def change
    create_table :suggests do |t|
      t.text :suggest_content

      t.timestamps
    end
  end
end
