class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates_uniqueness_of :name
end
