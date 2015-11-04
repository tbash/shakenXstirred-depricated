class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :show_cocktails]

  # GET /ingredients
  def index
    @ingredients = Ingredient.all

    render json: @ingredients
  end

  # GET /ingredients/1
  def show
    render json: @ingredient.users
  end

  # GET /ingredients/1/cocktails
  def show_cocktails
    render json: @ingredient.cocktails
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end
