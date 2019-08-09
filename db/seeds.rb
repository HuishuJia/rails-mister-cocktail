# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_serialized = open(url).read
drinks = JSON.parse(drinks_serialized)

drinks['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

Cocktail.destroy_all

Cocktail.create(name: 'Arabesque')
Cocktail.create(name: 'Tendu')
Cocktail.create(name: 'Adagio')
Cocktail.create(name: 'Pointe')
Cocktail.create(name: 'Frappé')
Cocktail.create(name: 'Glissade')
