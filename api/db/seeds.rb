seed_file = File.join(Rails.root, 'db', 'seeds.yml')
config = YAML::load_file(seed_file)
Ingredient.create(config["ingredients"])
Cocktail.create(config["cocktails"])

config["cocktails_ingredients"].each do |c_i|
  Cocktail.find(c_i["cocktail_id"].to_i).ingredients << Ingredient.find(c_i["ingredient_id"].split(",").map(&:to_i))
end

unless Rails.env.production? 
  User.create(config["users"])

  config["users_ingredients"].each do |u_i|
    User.find(u_i["user_id"].to_i).ingredients << Ingredient.find(u_i["ingredient_id"].split(",").map(&:to_i))
  end
end

