FactoryBot.define do
  factory :payment do
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
