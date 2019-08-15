# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
Booking.destroy_all
Boat.destroy_all
User.destroy_all

avatars = ['https://download.ams.birds.cornell.edu/api/v1/asset/28489491/medium', \
            'https://download.ams.birds.cornell.edu/api/v1/asset/169495571/1800', \
            'https://download.ams.birds.cornell.edu/api/v1/asset/28488411/medium', \
            'https://download.ams.birds.cornell.edu/api/v1/asset/27440241/medium', \
            'https://download.ams.birds.cornell.edu/api/v1/asset/29063561/medium'
            ]
counter = 0
5.times do
  user = User.create(
    email: Faker::Internet.email,
    password: '123456',
    user_image: avatars[counter]
  )
  counter += 1
  rand(3..5).times do
    ports = ["Port de Pully", "Port de Vidy", "Port de Paudex", "Port de Thonon-les-Bains", "Port de Nyon", "Port de Villeneuve", "Port Noir"]
    boat_type = ["yacht", "sailboat", "canoe", "fishing boat"]
    description = "Allons! the inducements shall be greater,
                    We will sail pathless and wild seas,
                    We will go where winds blow, waves dash, and the Yankee clipper speeds by under full sail.

                    Allons! with power, liberty, the earth, the elements,
                    Health, defiance, gayety, self-esteem, curiosity;
                    Allons! from all formules!
                    From your formules, O bat-eyed and materialistic priests.

                    The stale cadaver blocks up the passage—the burial waits no longer.

                    Allons! yet take warning!
                    He traveling with me needs the best blood, thews, endurance,
                    None may come to the trial till he or she bring courage and health,
                    Come not here if you have already spent the best of yourself,
                    Only those may come who come in sweet and determin’d bodies,
                    No diseas’d person, no rum-drinker or venereal taint is permitted here.

                    (I and mine do not convince by arguments, similes, rhymes,
                    We convince by our presence.) "
    Boat.create(
      name: Faker::Coffee.blend_name,
      price_per_day: rand(50..1000),
      capacity: rand(2..20),
      location: ports.sample,
      boat_type: boat_type.sample,
      description: description,
      image_url: 'https://source.unsplash.com/qToVxSYXPYU/1600x900',
      user_id: user.id
    )
  end

end

