class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :payment

  validates :quantity, presence: true, numericality: true
  validates :total, presence: true, numericality: true
end
