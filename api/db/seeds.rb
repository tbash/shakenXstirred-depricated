seed_file = File.join(Rails.root, 'db', 'seeds.yml')
config = YAML::load_file(seed_file)
Ingredient.create(config["ingredients"])
Cocktail.create(config["cocktails"])

config["cocktails_ingredients"].each do |c_i|
  Cocktail.find(c_i["cocktail_id"].to_i).ingredients << Ingredient.find(c_i["ingredient_id"].split(",").map(&:to_i))
end

