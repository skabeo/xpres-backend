class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :rating, presence: true, numericality: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :comment, presence: true, length: { maximum: 100 }
end
