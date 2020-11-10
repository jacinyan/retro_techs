# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
if Item.count == 1
    20.times do |i|
        Item.create(
            name: Faker::Item.name,
            in_stock: "Yes",
            price: rand(10..100),
            description: Faker::Quote.famous_last_words 
        )
        puts "created item number #{i + 1 }"
    end 
end 