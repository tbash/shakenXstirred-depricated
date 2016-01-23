class CreateUserCocktails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_cocktails do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :cocktail, index: true, foreign_key: true

      t.timestamps
    end
  end
end
