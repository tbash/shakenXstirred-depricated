class CreateMixtures < ActiveRecord::Migration
  def change
    create_table :mixtures do |t|
      t.integer :cocktail_id
      t.integer :ingredient_id
    end
  end
end
