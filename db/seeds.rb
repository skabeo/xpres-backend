# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
  UserAddress.create!(
    user_id: User.all.sample.id,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    tel_line: Faker::PhoneNumber.phone_number
  )
end
