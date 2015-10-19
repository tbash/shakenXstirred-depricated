seed_file = File.join(Rails.root, 'db', 'seeds.yml')
config = YAML::load_file(seed_file)
Cocktail.create(config["cocktails"])
Ingredient.create(config["ingredients"])
