class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :about
  has_many :cocktails
  has_many :ingredients
end
