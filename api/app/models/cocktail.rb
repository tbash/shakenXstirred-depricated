class Cocktail < ActiveRecord::Base
  has_many :mixtures
  has_many :ingredients, through: :mixtures
  has_many :mixologies
  has_many :users, through: :mixologies
end
