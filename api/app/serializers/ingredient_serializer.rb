class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :users
  has_many :cocktails
end
