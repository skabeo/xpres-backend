class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :payment
end
