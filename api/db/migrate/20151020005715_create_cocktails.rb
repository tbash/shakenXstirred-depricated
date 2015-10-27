class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :name, null: false
      t.text :recipe, null: false
      t.index :name,  unique: true
    end
  end
end
