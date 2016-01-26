class CreateMixtures < ActiveRecord::Migration[5.0]
  def change
    create_table :mixtures do |t|
      t.belongs_to :cocktail, index: true, foreign_key: true
      t.belongs_to :ingredient, index: true, foreign_key: true

      t.timestamps
    end
  end
end
