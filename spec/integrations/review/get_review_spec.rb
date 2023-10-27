require 'rails_helper'

RSpec.describe 'Review', type: :request do
  describe 'GET /api/v1/reviews' do
    before do
      get '/api/v1/reviews'
    end

    it 'should have a success status' do
      expect(response).to have_http_status(:success)
    end
  end
end
