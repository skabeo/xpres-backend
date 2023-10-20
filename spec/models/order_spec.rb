require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Order model' do
    user = User.first
    product = Product.last
    payment = Payment.first

    quantity = rand(15..25)
    total_order = product.price.to_i * quantity

    subject do
      Order.new(
        user_id: user.id,
        product_id: product.id,
        payment_id: payment.id,
        quantity:,
        total: total_order
      )
    end

    before { subject.save }

    it 'quantity should be present' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'quantity should be an integer' do
      subject.quantity = 'hey'
      expect(subject).to_not be_valid
    end

    it 'total should be present' do
      subject.total = nil
      expect(subject).to_not be_valid
    end

    it 'total should be an integer' do
      subject.total = 'hey'
      expect(subject).to_not be_valid
    end

    it 'to be valid' do
      expect(subject).to be_valid
    end
  end
end
