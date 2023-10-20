require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category model' do
    category = Category.first

    it 'name should be present' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'name should have maximum of 30 characters' do
      category.name = 'Lorem ipum ipsum lorem ipsum lorem'
      expect(category).to_not be_valid
    end

    it 'shoukd be valid' do
      category = Category.create(name: 'Assessories')
      expect(category).to be_valid
    end
  end
end
