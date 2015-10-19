class CocktailSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe, :can_make
end
