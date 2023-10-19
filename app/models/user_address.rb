class UserAddress < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :address, presence: true, length: { maximum: 30 }
  validates :city, presence: true, length: { maximum: 30 }
  validates :tel_line, presence: true, length: { maximum: 10 }
end
