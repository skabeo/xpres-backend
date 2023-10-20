require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'Review model' do
    user = User.first
    product = Product.last

    subject { Review.new(
      user_id: user.id,
      product_id: product.id,
      rating: rand(1..5),
      comment: Faker::Lorem.paragraph(sentence_count: 3)
    )}

    it 'should have rating present' do
      subject.rating = nil
      expect(subject).to_not be_valid
    end

    it 'should have integer data type for rating' do
      subject.rating = 'hey'
      expect(subject).to_not be_valid
    end

    it 'ratings should only be 1-5' do
      subject.rating = 6
      expect(subject).to_not be_valid
    end

    it 'should have comments present' do
      subject.comment = nil
      expect(subject).to_not be_valid
    end

    it 'comment should have maximum of 100 characters' do
      comment = 'Lorem ipsum ' * 10
      subject.comment = comment
      expect(subject).to_not be_valid
    end

    it 'should be vaild' do
      expect(subject).to be_valid
    end
  end
end
