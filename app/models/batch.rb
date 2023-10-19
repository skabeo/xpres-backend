class Batch < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :batch_number, presence: true, numericality: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :shipping_cost, presence: true, numericality: true
end
