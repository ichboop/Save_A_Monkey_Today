require "faker"
# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Monkey.destroy_all

user = 30.times do
    User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password)
end
p user

30.times do 
  monkey = Monkey.create(
    name: Faker::Creature::Animal.name,
    species: Faker::Creature::Dog.gender,
    city: Faker::Nation.capital_city,
    user_id: rand(1..30))
end