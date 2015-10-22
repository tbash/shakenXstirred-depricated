class User < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_secure_password

  def as_json(options={})
    {
      id: self.id,
      name: self.name
    }
  end

end
