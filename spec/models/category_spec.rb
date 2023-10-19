require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category model' do
    subject { Category.new(name: 'Utensils') }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should have maximum of 30 characters' do
      subject.name = 'Lorem ipum ipsum lorem ipsum lorem'
      expect(subject).to_not be_valid
    end

    it 'shoukd be valid' do
      expect(subject).to be_valid
    end
  end
end
