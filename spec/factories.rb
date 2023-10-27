FactoryBot.define do
  factory :payment do
    user_id { User.all.sample.id }
    provider { Faker::Subscription.payment_method }
    status { 'Approved' }
    ref { Faker::Number.number(digits: 10) }
    amount { Faker::Number.decimal(l_digits: 3) }
  end
end

FactoryBot.define do
  factory :batch do
    batch_number { rand(1..100) }
    start_date { Faker::Date.between(from: '2023-10-01', to: '2023-10-18') }
    end_date { Faker::Date.between(from: '2023-10-19', to: '2023-10-31') }
    shipping_cost { rand(100..500) }
  end
end

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { '123456' }
  end
end

FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
  end
end

FactoryBot.define do
  product = Product.all.sample
  user = User.all.sample

  factory :order do
    user_id { user.id }
    product_id { product.id }
    payment_id do
      user_payment = Payment.find_by(user_id: user.id)

      user_payment ? user_payment.id : 1
    end
    quantity { rand(1..15) }
    total { product.price * quantity }
  end
end

FactoryBot.define do
  factory :product do
    category_id { Category.all.sample.id }
    batch_id { Batch.all.sample.id }
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(sentence_count: 4) }
    brand { Faker::Commerce.brand }
    weight_kg { Faker::Number.decimal(l_digits: 2) }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 3) }
    quantity { rand(100..599) }
  end
end
