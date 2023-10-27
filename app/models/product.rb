class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :images
  belongs_to :category
  belongs_to :batch

  validates :name, :description, :price, presence: true
  validates :description, presence: true, length: { maximum: 250 }
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true
  # validate :unique_name_within_batch

  private

  def unique_name_within_batch
    return unless self.class.where(name:, batch_id:).where.not(id:).exists?

    errors.add(:name, 'already exists for this batch')
  end
end
