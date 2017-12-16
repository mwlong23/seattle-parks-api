# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed
  Park.destroy_all
  Neighborhood.destroy_all



  def self.begin
    seed = Seed.new
    seed.generate_parks
  end

  def generate_parks
    10.times do |j|
      neighborhood = Neighborhood.create(name: Faker::HitchhikersGuideToTheGalaxy.planet)
      10.times do |i|
        Park.create!(
        name: Faker::TwinPeaks.location,
        description: Faker::Hipster.paragraph,
        address: Faker::Address.street_address,
        bathroom: Faker::Boolean.boolean,
        drinking_fountain: Faker::Boolean.boolean,
        dog_park: Faker::Boolean.boolean,
        playground: Faker::Boolean.boolean,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        neighborhood_id: neighborhood.id
        )
      end
    end
  end
end
Seed.begin
