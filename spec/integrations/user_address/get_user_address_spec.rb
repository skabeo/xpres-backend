require 'rails_helper'

RSpec.describe 'User address', type: :request do
  describe 'GET /api/v1/user_addresses' do
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in user
      
      get '/api/v1/user_addresses'
    end

    it 'have a success status' do
      expect(response).to have_http_status(:success)
    end
  end
end
