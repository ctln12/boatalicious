require 'open-uri'

puts 'Deleting bookings...'
Booking.destroy_all

puts 'Deleting boats...'
Boat.destroy_all

puts 'Deleting users...'
User.destroy_all

puts 'Creating 16 users...'

puts '... 1 renter'
renter = User.new(
  email: 'john.marshall@gmail.com',
  password: '123456'
)
renter.save!

puts '... 15 owners'

ports = ['Port de Pully', 'Port de Vidy', 'Port de Paudex', 'Port de Thonon-les-Bains', 'Port de Nyon', 'Port de Villeneuve', 'Port Noir']

def boat_description(boat_type)
  boat_adjectives = ['Beautiful', 'Lovely', 'Spacious', 'Marvelous', 'Sensational', 'Stunning']
  afternoon_adjectives = ['exciting', 'incredible', 'awesome', 'amazing', 'exceptional']

  if boat_type == 'catamaran'
    "#{boat_adjectives.sample} catamaran with cabin and WC for an #{afternoon_adjectives.sample} day!"
  elsif boat_type == 'motorboat'
    "Want to spend an #{afternoon_adjectives.sample} afternoon? Try this #{boat_adjectives.sample.downcase} motorboat!"
  elsif boat_type == 'sailboat'
    "Go on an #{afternoon_adjectives.sample} adventure onboard this #{boat_adjectives.sample.downcase} sailboot!"
  end
end

def compute_capacity(boat_type)
  if boat_type == 'catamaran'
    rand(10..15)
  elsif boat_type == 'motorboat'
    rand(6..10)
  elsif boat_type == 'sailboat'
    rand(2..8)
  end
end

def compute_price_per_day(boat_type)
  if boat_type == 'catamaran'
    rand(70..90)
  elsif boat_type == 'motorboat'
    rand(60..80)
  elsif boat_type == 'sailboat'
    rand(50..70)
  end
end

boats = [
  {
    type: 'catamaran',
    female_owner_photos: [
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540165/Rails%20Boatalicious/catamaran-1_qyzc2r.jpg',
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586542368/Rails%20Boatalicious/catamaran-2_iwisnc.jpg'
    ],
    male_owner_photos: [
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540162/Rails%20Boatalicious/catamaran-3_xn36ht.jpg',
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540163/Rails%20Boatalicious/catamaran-4_cr5ium.jpg',
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540162/Rails%20Boatalicious/catamaran-5_b2jtib.jpg'
    ]
  },
  {
    type: 'motorboat',
    female_owner_photos: [
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540188/Rails%20Boatalicious/motorboat-1_i31vxb.jpg',
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540187/Rails%20Boatalicious/motorboat-2_rbq7cd.jpg'
    ],
    male_owner_photos: [
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540188/Rails%20Boatalicious/motorboat-3_gnpc0o.jpg',
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540186/Rails%20Boatalicious/motorboat-4_sgyuud.jpg',
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540182/Rails%20Boatalicious/motorboat-5_wbtnom.jpg'
    ]
  },
  {
    type: 'sailboat',
    female_owner_photos: [
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540187/Rails%20Boatalicious/sailboat-1_wtebds.jpg',
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540185/Rails%20Boatalicious/sailboat-2_erx8f3.jpg'
    ],
    male_owner_photos: [
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540191/Rails%20Boatalicious/sailboat-3_vpk8zn.jpg',
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540194/Rails%20Boatalicious/sailboat-4_jo4kag.jpg',
      'https://res.cloudinary.com/digkmcfas/image/upload/v1586540189/Rails%20Boatalicious/sailboat-5_tpaco2.jpg'
    ]
  }
]

boats.each do |boat|
  puts "... creating #{boat[:type]}s"
  puts '    ... 2 boats with female owner'
  boat[:female_owner_photos].each do |photo_url|
    female_owner = User.new(
      email: "#{Faker::Name.female_first_name.downcase}.#{Faker::Name.last_name.downcase}@gmail.com",
      password: '123456'
    )
    female_owner.save!
    new_boat = Boat.new(
      name: Faker::Coffee.blend_name,
      price_per_day: compute_price_per_day(boat[:type]),
      capacity: compute_capacity(boat[:type]),
      location: ports.sample,
      boat_type: boat[:type],
      description: boat_description(boat[:type]),
      remote_photo_url: photo_url,
      user_id: female_owner.id
    )
    new_boat.save!
  end
  puts '    ... 3 boats with male owner'
  boat[:male_owner_photos].each do |photo_url|
    male_owner = User.new(
      email: "#{Faker::Name.male_first_name.downcase}.#{Faker::Name.last_name.downcase}@gmail.com",
      password: '123456'
    )
    male_owner.save!
    new_boat = Boat.new(
      name: Faker::Coffee.blend_name,
      price_per_day: compute_price_per_day(boat[:type]),
      capacity: compute_capacity(boat[:type]),
      location: ports.sample,
      boat_type: boat[:type],
      description: boat_description(boat[:type]),
      remote_photo_url: photo_url,
      user_id: male_owner.id
    )
    new_boat.save!
  end
end

puts 'Finished!'
