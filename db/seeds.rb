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

# Seed 50 users
users = []
50.times do |i|
  users << User.create!(
    email: "user#{i + 1}@example.com",
    password: "hahahaha123"
  )
end

# Seed 20 gyms
gyms = []
20.times do |i|
  gyms << Gym.create!(
    address: "Gym #{i + 1} Street, City",
    description: "Description for Gym #{i + 1}",
    price: rand(30..100),  # Random price between 30 and 100
    user: users.sample
  )
end

# Seed 10 memberships
memberships = []
10.times do
  memberships << Membership.create!(
    date: Faker::Date.between(from: 1.year.ago, to: Date.today),  # Using Faker gem for random date
    user: users.sample,
    gym: gyms.sample
  )
end

# Seed 50 reviews
reviews = []
50.times do
  reviews << Review.create!(
    rating: rand(1..5),  # Random rating between 1 and 5
    content: Faker::Lorem.paragraph,  # Using Faker gem for random content
    user: users.sample,
    gym: gyms.sample
  )
end
