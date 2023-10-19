class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :rating, presence: true, numericality: true
  validates :comment, presence: true, length: { maximum: 100 }
end
