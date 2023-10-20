require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'Payment model' do

    subject { Payment.new(
      provider: Faker::Subscription.payment_method,
      status: "Approved",
      ref: Faker::Number.number(digits: 10),
      amount: Faker::Number.decimal(l_digits: 3)
    ) }

    it 'provider should be present' do
      subject.provider = nil 
      expect(subject).to_not be_valid
    end

    it 'status should be present' do
      subject.status = nil 
      expect(subject).to_not be_valid
    end

    it 'ref should be present' do
      subject.ref = nil 
      expect(subject).to_not be_valid
    end

    it 'amount should to present' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'amount must be an integer' do
      subject.amount = 'hey'
      expect(subject).to_not be_valid
    end

    it 'to be valid' do
      expect(subject).to be_valid
    end
  end
end
