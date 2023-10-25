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
    name { 'Jewellery' }
  end
end
