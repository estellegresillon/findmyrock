# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Band.destroy_all
User.destroy_all

first_user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8)
    )
first_band = Band.create(
  name: Faker::Superhero.name,
  description: Faker::Lorem.sentence,
  price_per_hour: Random.rand(100..15000),
  number_of_musicians: Random.rand(1..6),
  address: ["Paris", "Dijon", "Reims"].sample,
  music_style: ["Rock", "Metal", "Pop", "Blues"].sample,
  user: first_user
  )


50.times do
  booking = Booking.create(
    user: User.last,
    address: "Paris",
    date: Date.new(2018, 5, 14),
    band: Band.last
    )
  new_user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8)
    )
  new_band = Band.create(
    name: Faker::Superhero.name,
    description: Faker::Lorem.sentence,
    price_per_hour: Random.rand(100..6000),
    number_of_musicians: Random.rand(1..6),
    address: ["Paris", "Dijon", "Reims"].sample,
    music_style: ["Rock", "Metal", "Pop", "Blues"].sample,
    user: new_user
    )
end

