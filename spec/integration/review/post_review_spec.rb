require 'rails_helper'

RSpec.describe 'Review', type: :request do
  describe 'POST /api/v1/reviews' do
    let(:json) { JSON.parse(response.body) }
    let(:review) { FactoryBot.create(:review) }

    before do
      post '/api/v1/reviews', params: {
        review: {
          user_id: review.user_id,
          product_id: review.product_id,
          rating: review.rating,
          comment: review.comment
        }
      }
    end

    it 'have a created status' do
      expect(response).to have_http_status(:created)
    end

    it 'returns rating' do
      expect(json['rating']).to eq(review.rating)
    end

    it 'returns comment' do
      expect(json['comment']).to eq(review.comment)
    end
  end
end
