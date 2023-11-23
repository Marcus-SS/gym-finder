# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Review.destroy_all
Membership.destroy_all
Gym.destroy_all
User.destroy_all

puts "seed 50 users"
users = []
50.times do |i|
  users << User.create!(
    email: "user#{i + 1}@example.com",
    password: "hahahaha123"
  )
end
puts "finished users"

puts "Seed 20 gyms"
gyms = []
categories = ["gyms", "Strengthtraining", "weight", "weightlifting", "bodybuilding", "weights", "barbell", "dumbell", "muscles"]
gym_address_bali = [[-8.649178673933879, 115.13463439507512],

  [-8.692410224338918, 115.18072485072497],

  [-8.594959734528114, 115.14868355596353],

  [-8.603785775615489, 115.11023140906364],

  [-8.626189417234048, 115.25442696493546],

  [-8.694749866378203, 115.21254159063382],

  [-8.801977649793484, 115.18232918949823],

  [-8.546073330222663, 115.20498849034992],

  [-8.524344025068375, 115.17614938017503],

  [-8.532492659420596, 115.29013252991392]]


  gym_address_tokyo = [
  [35.71062788769803, 139.8266983814198],

  [35.715645582195826, 139.736061178013],

  [35.65094887687504, 139.7223282684059],

  [35.77694742652599, 139.7916794619217],

  [35.642579093655804, 139.70584877687736],

  [35.708955252663806, 139.73125465965052],

  [35.69557290886016, 139.6529770721442],

  [35.67772629003266, 139.61452492203176],

  [35.74853153244685, 139.67906959718508],

  [35.687765502852294, 139.83356483666256]
  ]

9.times do |i|
  coord = gym_address_tokyo.sample
  gym_address_tokyo.delete(coord)
  gyms << Gym.create!(
    name: Faker::Company.name,
    address: "Gym #{i + 1} Street, Tokyo",
    lat: coord[0],
    lng: coord[1],
    description: "Description for Gym #{i + 1}",
    price: rand(30..100),  # Random price between 30 and 100
    user: users.sample,
    preview: Faker::LoremFlickr.image(size: '300x300', search_terms: [categories[i%categories.length]]),
    city: "Tokyo"
  )

end
puts "finished gyms 1"

9.times do |i|
  coord = gym_address_bali.sample
  gym_address_bali.delete(coord)
  gyms << Gym.create!(
    name: Faker::Company.name,
    address: "Gym #{i + 1} Street, Bali",
    lat: coord[0],
    lng: coord[1],
    description: "Description for Gym #{i + 1}",
    price: rand(30..100),  # Random price between 30 and 100
    user: users.sample,
    preview: Faker::LoremFlickr.image(size: '300x300', search_terms: [categories[i%categories.length]]),
    city: "Bali"
  )
end
puts "finished gyms 2"

puts "Seed 10 memberships"
memberships = []
10.times do
  memberships << Membership.create!(
    date: Faker::Date.between(from: 1.year.ago, to: Date.today),  # Using Faker gem for random date
    user: users.sample,
    gym: gyms.sample
  )
end
puts "finished memberships"

puts "Seed 50 reviews"
reviews = []
50.times do
  reviews << Review.create!(
    rating: rand(1..5),  # Random rating between 1 and 5
    content: Faker::Lorem.paragraph,  # Using Faker gem for random content
    user: users.sample,
    gym: gyms.sample
  )
end
puts "finished reviews"
