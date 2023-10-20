class Batch < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :batch_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :shipping_cost, presence: true, numericality: true
end
