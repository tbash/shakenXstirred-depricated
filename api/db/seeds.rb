cocktails_seed_file = File.join(Rails.root, 'db', 'seeds/cocktails.yml')
ingredients_seed_file = File.join(Rails.root, 'db', 'seeds/ingredients.yml')
mixtures_seed_file = File.join(Rails.root, 'db', 'seeds/mixtures.yml')

cocktails_config = YAML::load_file(cocktails_seed_file)
ingredients_config = YAML::load_file(ingredients_seed_file)
mixtures_config = YAML::load_file(mixtures_seed_file)

Ingredient.create(ingredients_config)
Cocktail.create(cocktails_config)

mixtures_config.each do |mixture|
  Cocktail.find(mixture["cocktail_id"].to_i).ingredients << Ingredient.find(mixture["ingredient_id"].split(",").map(&:to_i))
end

unless Rails.env.production? 
  users_seed_file = File.join(Rails.root, 'db', 'seeds/users.yml')
  users_config = YAML::load_file(users_seed_file)
  User.create(users_config["users"])

  users_config["users_ingredients"].each do |u_i|
    User.find(u_i["user_id"].to_i).ingredients << Ingredient.find(u_i["ingredient_id"].split(",").map(&:to_i))
  end
end

