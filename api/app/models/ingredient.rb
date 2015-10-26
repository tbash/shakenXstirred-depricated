class Ingredient < ActiveRecord::Base
  has_many :mixtures
  has_many :cocktails, through: :mixtures
  has_many :inventories
  has_many :users, through: :inventories
end
