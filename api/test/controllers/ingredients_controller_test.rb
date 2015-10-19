require 'test_helper'

class IngredientsControllerTest < ActionController::TestCase
  setup do
    @ingredient = ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create ingredient" do
    assert_difference('Ingredient.count') do
      post :create, params: { ingredient: { name: @ingredient.name } }
    end

    assert_response 201
  end

  test "should show ingredient" do
    get :show, params: { id: @ingredient }
    assert_response :success
  end

  test "should update ingredient" do
    patch :update, params: { id: @ingredient, ingredient: { name: @ingredient.name } }
    assert_response 200
  end

  test "should destroy ingredient" do
    assert_difference('Ingredient.count', -1) do
      delete :destroy, params: { id: @ingredient }
    end

    assert_response 204
  end
end
