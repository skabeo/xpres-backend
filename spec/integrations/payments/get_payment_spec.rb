require 'rails_helper'

RSpec.describe 'Payment', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:payment, 9)
      get '/api/v1/payments'
    end

    it 'returns all payments' do
      response_data = JSON.parse(response.body)
      expect(response_data.size).to eq(10)
    end

    it 'should return status 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
