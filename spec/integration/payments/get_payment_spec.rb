require 'rails_helper'

RSpec.describe 'Payment', type: :request do
  describe 'GET /index' do
    context 'can view all payment when user is an admin' do
      before do
        @admin_user = FactoryBot.create(:user, role: 'admin')
        sign_in @admin_user

        get '/api/v1/payments'
      end

      it 'should return status 200' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'access restricted as a normal user' do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user

        get '/api/v1/payments'
      end

      it 'should have forbidden http status' do
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'user should be unathorized when not signed in' do
      before do
        get '/api/v1/payments'
      end

      it 'should have http status of unathorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
