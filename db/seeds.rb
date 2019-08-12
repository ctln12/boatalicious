# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



20.times do
  boat_type = ["yacht", "sailboat", "canoe", "fishing boat"]
  Boat.create(
  name: Faker::Coffee.blend_name,
  price_per_day: rand(50..1000),
  capacity: rand(2..20),
  location: Faker::Address.full_address,
  boat_type: boat_type.sample,
  owner_name: Faker::Name.name,
  description: Faker::Lorem.paragraph
  )
end
