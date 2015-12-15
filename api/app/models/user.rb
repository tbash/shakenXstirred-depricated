class User < ActiveRecord::Base
  has_many :mixologies
  has_many :cocktails, through: :mixologies
  has_many :inventories
  has_many :ingredients, through: :inventories
  has_secure_password
  after_initialize :update_mixologies

  def update_mixologies
    cocktails = []
    ingredient_ids = []
    self.ingredients.each { |i| ingredient_ids << i.id }
    Mixture.where(ingredient_id: ingredient_ids).each do |mix|
      if (mix.cocktail.ingredients - self.ingredients).empty?
        cocktails << mix.cocktail
      end
    end
    
    self.cocktails = (cocktails & self.cocktails) | cocktails
  end

  def update_inventory(ingredient_ids)
    ingredients = Ingredients.find(ingredient_ids)
    self.ingredients = ingredients
  end
end
