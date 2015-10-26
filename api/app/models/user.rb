class User < ActiveRecord::Base
  has_many :mixologies
  has_many :cocktails, through: :mixologies
  has_many :inventories
  has_many :ingredients, through: :inventories
  has_secure_password

end
