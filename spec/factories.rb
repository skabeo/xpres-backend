FactoryBot.define do
  factory :payment do
    provider { Faker::Subscription.payment_method } 
    status { "Approved" } 
    ref { Faker::Number.number(digits: 10) } 
    amount { Faker::Number.decimal(l_digits: 3) }
  end
end