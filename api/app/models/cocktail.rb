class Cocktail < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  def as_json(options={})
    {
      id: self.id,
      name: self.name,
      recipe: self.recipe
    }
  end

end
