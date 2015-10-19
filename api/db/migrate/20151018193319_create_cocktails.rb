class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :name
      t.text :recipe
      t.boolean :can_make, null: false, default: false
    end
  end
end
