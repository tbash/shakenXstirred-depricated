class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  # GET /cocktails
  def index
    @cocktails = Cocktail.all

    render json: @cocktails
  end 

  # GET /cocktails/1
  def show
    render json: @cocktail
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cocktail_params
      params.require(:cocktail).permit(:name, :recipe)
    end
end
