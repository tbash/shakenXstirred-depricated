class Inventory < ActiveRecord::Base
  belongs_to :user
  belongs_to :ingredient
  after_initialize :update_inventory

  def update_inventory
    user = User.find params[:id]
    incoming_ingredients = Ingredient.find(params[:ingredients])
    user.ingredients = (incoming_ingredients & user.ingredients) | incoming_ingredients
    incoming_cocktails = []
    Mixture.where(ingredient_id: params[:ingredient_ids]).each do |mix|
      if (mix.cocktail.ingredients - user.ingredients).empty?
        incoming_cocktails << mix.cocktail
      end
    end
    
    user.cocktails = (incoming_cocktails & user.cocktails) | incoming_cocktails
  end
end
