class CreateBeers < ActiveRecord::Migration[7.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.float :abv
      t.integer :ibu
      t.string :style
      t.references :brewery, null: false, foreign_key: true
      t.float :ounces

      t.timestamps
    end
  end
end
