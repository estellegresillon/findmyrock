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


16.times do
  new_user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8)
    )
  new_band = Band.create(
    name: Faker::Superhero.name,
    description: Faker::Lorem.sentence,
    price: Random.rand(100..15000),
    number_of_musicians: Random.rand(1..6),
    service_duration: [30, 45, 60, 90, 120, 180].sample,
    music_style: ["Rock", "Metal", "Pop"].sample,
    user: new_user
    )
  # booking = Booking.create(
  #   user: User.sample
  #   )
end

