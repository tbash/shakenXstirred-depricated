class User < ApplicationRecord
  has_many :user_cocktails
  has_many :cocktails, through: :user_cocktails
  has_many :inventories
  has_many :ingredients, through: :inventories
  has_secure_password

  def update_mixologies(ingredient_ids)
    Mixture.where(ingredient_id: ingredient_ids).each do |mix|
      if (mix.cocktail.ingredients - self.ingredients).empty?
        cocktails << mix.cocktail
      end
    end

    self.cocktails = cocktails
  end

  def update_inventory(ingredient_ids)
    ingredients = Ingredient.find(ingredient_ids)
    self.ingredients = ingredients
    self.update_mixologies ingredient_ids
  end
end
