require "faker"
# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destorying the database..."
Getaway.destroy_all
Monkey.destroy_all
User.destroy_all
puts "Database destroyed!"
puts "Creating the Users..."
users = []
30.times do
  users << User.create(
  email: Faker::Internet.email,
  password: "123456")
end

puts "Users created!"
puts "Creating 1 monkey and 1 getaway for each user..."

monkeys = []

users.each do |user|
    monkey = Monkey.create(
    name: Faker::Name.name,
    species: "gorilla",
    city: Faker::Nation.capital_city,
    description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et",
    user_id: user.id,
    address: '16 Villa Gaudelet, Paris')
    # longitude: Faker::Address.longitude,
    # latitude: Faker::Address.latitude)
    Getaway.create(
      date: Date.new(2001,2,3),
      monkey_id: monkey.id,
      user_id: user.id
    )
    monkeys << monkey
end

puts " 1 monkey for each user created"
puts "Creating random getaways..."

200.times do
  Getaway.create(
    date: Date.new(2001,2,3),
    monkey_id: monkeys[rand(0..monkeys.size - 1)].id,
    user_id: users[rand(0..users.size - 1)].id
  )
end

puts "Random Getaways created!"
puts "Seed completed!!"
