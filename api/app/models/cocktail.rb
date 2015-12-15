class Cocktail < ActiveRecord::Base
  has_many :mixtures
  has_many :ingredients, through: :mixtures
  has_many :mixologies
  has_many :users, through: :mixologies
  after_initialize :generate_mix, if: :new_record?

  def generate_mix
    Ingredient.all.each do |ingredient|
      if self.recipe.match(/#{ingredient.name}/)
        self.ingredients << ingredient
      end
    end
  end
end
