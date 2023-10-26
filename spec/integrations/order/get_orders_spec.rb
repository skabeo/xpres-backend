require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'GET /orders' do
    let(:response_data) { JSON.parse(response.body) }
    context 'can fetch all orders as admin' do
      before do
        @user = FactoryBot.create(:user, role: 'admin')
        sign_in @user
  
        get '/api/v1/orders'
      end
  
      it 'displays order' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'cant fetch orders as a normal user' do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
  
        get '/api/v1/orders'
      end

      it 'restrict orders' do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
