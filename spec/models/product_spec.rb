require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Product model' do

    category = Category.first
    batch = Batch.first
    product = Product.last

    it 'product name should not be blank' do
      product.name = nil
      expect(product).to_not be_valid
    end

    it 'description should not be blank' do
      product.description = nil
      expect(product).to_not be_valid
    end

    it 'price should be present' do
      product.price = nil
      expect(product).to_not be_valid
    end

    it 'price should be an integer' do
      product.price = 'hey'
      expect(product).to_not be_valid
    end

    it 'quantity should be present' do
      product.quantity = nil
      expect(product).to_not be_valid
    end

    it 'quamtity should be an integer' do
      product.quantity = 'hey'
      expect(product).to_not be_valid
    end

    it 'product should not has the same batch twice' do
      product_one = Product.create(
        category_id: 9,
        batch_id: 47,
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph(sentence_count: 4),
        brand: Faker::Commerce.brand,
        weight_kg: Faker::Number.decimal(l_digits: 2),
        price: Faker::Number.decimal(l_digits: 2, r_digits: 3)
      )

      product_two = Product.create(
        category_id: 9,
        batch_id: 47,
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph(sentence_count: 4),
        brand: Faker::Commerce.brand,
        weight_kg: Faker::Number.decimal(l_digits: 2),
        price: Faker::Number.decimal(l_digits: 2, r_digits: 3)
      )

      expect(product_two).to_not be_valid
    end

    it 'should pass' do
      product = Product.create(
        category_id: 8,
        batch_id: 46,
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph(sentence_count: 4),
        brand: Faker::Commerce.brand,
        weight_kg: Faker::Number.decimal(l_digits: 2),
        price: Faker::Number.decimal(l_digits: 2, r_digits: 3),
        quantity: rand(500..1000)
      )
      expect(product).to be_valid
    end
  end
end
