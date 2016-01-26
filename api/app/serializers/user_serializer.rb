class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :about
  has_many :cocktails
  has_many :ingredients
  has_many :followers
  has_many :following

  # def followers
  #   object.followers
  # end

  # def following
  #   object.following
  # end
end
