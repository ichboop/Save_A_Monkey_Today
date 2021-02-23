require "faker"
# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Monkey.destroy_all
User.destroy_all

users = []
30.times do
  users << User.create(
  email: Faker::Internet.email,
  password: Faker::Internet.password)
end

users.each do |user|
    monkey = Monkey.create(
    name: Faker::Creature::Animal.name,
    species: "gorilla",
    city: Faker::Nation.capital_city,
    user_id: user.id)
    Getaway.create(
      date: Date.new(2001,2,3),
      monkey_id: monkey.id,
      user_id: user.id
    )
end