class InventoryController < ApplicationController
  # PATCH/PUT /update_ingredients
  def update_ingredients
    user = User.find_by(authentication_token: params[:API_KEY])
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
