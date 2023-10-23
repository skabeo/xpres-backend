# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 5.times do
#   UserAddress.create!(
#     user_id: User.all.sample.id,
#     address: Faker::Address.street_address,
#     city: Faker::Address.city,
#     tel_line: Faker::PhoneNumber.phone_number
#   )
# end

# Category.create([
#   { name: "Utensils" },
#   { name: "Appliances" },
#   { name: "Furniture" },
#   { name: "Clothing" },
#   { name: "Cosmetics" },
#   { name: "Ornaments" },
#   { name: "Accessories" }
# ])

# 4.times do |num|
#   Batch.create!(
#     batch_number: num,
#     start_date: Faker::Date.between(from: '2023-10-01', to: '2023-10-18'),
#     end_date: Faker::Date.between(from: '2023-10-19', to: '2023-10-31'),
#     shipping_cost: rand(100..500)
#   )
# end

# 30.times do
#   Product.create!(
#     category_id: Category.all.sample.id,
#     batch_id: Batch.all.sample.id,
#     name: Faker::Commerce.product_name,
#     description: Faker::Lorem.paragraph(sentence_count: 4),
#     brand: Faker::Commerce.brand,
#     weight_kg: Faker::Number.decimal(l_digits: 2),
#     price: Faker::Number.decimal(l_digits: 2, r_digits: 3)
#   )
# end

# 10.times do
#   Payment.create!(
#     user_id: User.all.sample.id,
#     provider: Faker::Subscription.payment_method,
#     status: "Approved",
#     ref: Faker::Number.number(digits: 10),
#     amount: Faker::Number.decimal(l_digits: 3)
#   )
# end

# 10.times do |num|
#   product = Product.all.sample
#   quantity = rand(1..15)
#   total = product.price * quantity

#   Order.create!(
#     user_id: User.all.sample.id,
#     product_id: product.id,
#     payment_id: num + 1,
#     quantity: quantity,
#     total: total
#   )
# end

10.times do
  Review.create!(
    user_id: User.all.sample.id,
    product_id: Product.all.sample.id,
    rating: rand(1..5),
    comment: Faker::Lorem.paragraph(sentence_count: 3)
  )
end
