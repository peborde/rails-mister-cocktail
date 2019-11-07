# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'open-uri'
# require 'json'
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all
i = 0
source = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
data = JSON.load(open(source))
data['drinks'].each do |x, y|
  Ingredient.create(name: x['strIngredient1'])
  i += 1
end
ingredient1 = Ingredient.create(name: "lemon")
ingredient2 = Ingredient.create(name: "ice")
ingredient3 = Ingredient.create(name: "mint leaves")
cocktail1 = Cocktail.create(name: "Gin")
cocktail2 = Cocktail.create(name: "Whisky")
Dose.create(cocktail: cocktail1, ingredient: ingredient1, description: "Gin Tonic with lemons")
Dose.create(cocktail: cocktail2, ingredient: ingredient2, description: "Whisky with ice")

