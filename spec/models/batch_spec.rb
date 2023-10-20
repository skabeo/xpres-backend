require 'rails_helper'

RSpec.describe Batch, type: :model do
  describe 'Batch model' do
    subject do
      Batch.new(
        batch_number: 1,
        start_date: '2023-10-10',
        end_date: '2023-10-19',
        shipping_cost: 100
      )
    end

    before { subject.save }

    it 'batch number should not be blank' do
      subject.batch_number = nil
      expect(subject).to_not be_valid
    end

    it 'batch number should be an integer' do
      subject.batch_number = 'hey'
      expect(subject).to_not be_valid
    end

    it 'batch number should be greater than 0' do
      subject.batch_number = 0
      expect(subject).to_not be_valid
    end

    it 'start date should not be blank' do
      subject.start_date = nil
      expect(subject).to_not be_valid
    end

    it 'end date should not be blank' do
      subject.end_date = nil
      expect(subject).to_not be_valid
    end

    it 'shipping cost should not be blank' do
      subject.shipping_cost = nil
      expect(subject).to_not be_valid
    end

    it 'shipping cost should not be a string' do
      subject.shipping_cost = 'hey'
      expect(subject).to_not be_valid
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end
  end
end
