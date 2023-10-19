class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :images
  belongs_to :category
  belongs_to :batch

  validates :name, :description, :price, presence: true
end
