class Payment < ApplicationRecord
  has_one :order, dependent: :destroy

  validates :provider, :status, presence: true
  validates :amount, presence: true, numericality: true
  validates :status, :ref, presence: true
end
