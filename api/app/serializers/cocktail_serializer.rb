class CocktailSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe

  has_many :ingredients
  has_many :users
end
