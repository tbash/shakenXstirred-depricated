require 'test_helper'

class CocktailsControllerTest < ActionController::TestCase
  setup do
    @cocktail = cocktails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create cocktail" do
    assert_difference('Cocktail.count') do
      post :create, params: { cocktail: { name: @cocktail.name, recipe: @cocktail.recipe } }
    end

    assert_response 201
  end

  test "should show cocktail" do
    get :show, params: { id: @cocktail }
    assert_response :success
  end

  test "should update cocktail" do
    patch :update, params: { id: @cocktail, cocktail: { name: @cocktail.name, recipe: @cocktail.recipe } }
    assert_response 200
  end

  test "should destroy cocktail" do
    assert_difference('Cocktail.count', -1) do
      delete :destroy, params: { id: @cocktail }
    end

    assert_response 204
  end
end
