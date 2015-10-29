class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :show_ingredients, :show_cocktails]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # GET /users/1/ingredients
  def show_ingredients
    render json: @user.ingredients
  end

  # GET /users/1/cocktails
  def show_cocktails
    render json: @user.cocktails
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /user/1/update_ingredients
  def update_ingredients
    debugger
    @user = User.find(params[:id])
    @incoming_ingredients = Ingredient.find(params[:ingredient_ids])
    @user.ingredients = (@incoming_ingredients & @user.ingredients) | @incoming_ingredients
    @incoming_cocktails = []
    Mixture.where(ingredient_id: params[:ingredient_ids]).each {|m| @incoming_cocktails << m.cocktail}
    @user.cocktails = (@incoming_cocktails.uniq & @user.cocktails) | @incoming_cocktails.uniq

    render json: @user.ingredients
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, ingredient_ids: [])
    end
end
