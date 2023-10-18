class Product < ApplicationRecord
  has_many :orders
  belongs_to :category
  belongs_to :batch
end
