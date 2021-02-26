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
puts "Creating a lot of monkeys..."

monkeySpecies = ["Aye-aye", "Baboon", "Flying lemur", "Gibbon", "Gorilla", "Green monkey", "Lemur"]

monkeys = []

users.each do |user|
  10.times do
    monkey = Monkey.create(
    name: Faker::Name.name,
    species: monkeySpecies[rand(0..monkeySpecies.size - 1)],
    city: Faker::Nation.capital_city,
    description: "Member of The Banana Splits, an all-animal band. She played the drums. Likes sports! She is 8 years old, and she is the best player on her team in just about every sport they play",
    user_id: user.id,
    address: Faker::Address.street_address)
    # longitude: Faker::Address.longitude,
    # latitude: Faker::Address.latitude)
    monkeys << monkey
  end
end

puts "A lot of monkeys created!"
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
