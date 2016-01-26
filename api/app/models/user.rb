class User < ApplicationRecord
  has_many :user_cocktails
  has_many :cocktails, through: :user_cocktails
  has_many :inventories
  has_many :ingredients, through: :inventories
  has_many :followers, class_name: 'Followings', foreign_key: 'user_id'
  has_many :following, class_name: 'Followings', foreign_key: 'follower_id'

  has_secure_password

  def update_cocktails(ingredient_ids)
    cocktail_ids = Mixture.where(ingredient_id: ingredient_ids).pluck(:cocktail_id).uniq
    cocktails = Cocktail.where(id: cocktail_ids)
    can_make = []
    cocktails.each do |cocktail|
      if (cocktail.ingredients - self.ingredients).empty?
        can_make << cocktail
      end
    end

    self.cocktails = can_make
  end

  def update_inventory(ingredient_ids)
    ingredients = Ingredient.find(ingredient_ids)
    self.ingredients = ingredients
    self.update_cocktails ingredient_ids
  end
end
