require 'rails_helper'

RSpec.describe 'Session', type: :request do
  describe 'POST /api/v1/auth' do
    let(:response_data) { JSON.parse(response.body) }
    context 'when a user signs in' do
      before do
        @user = FactoryBot.create(:user)
        post '/api/v1/auth/login', params: {
          user: {
            email: @user.email,
            password: @user.password
          }
        }
      end

      it 'have a success status' do
        expect(response).to have_http_status(:ok)
      end

      it 'return the user email' do
        expect(response_data['data']['email']).to eq(@user.email)
      end

      it 'return the user first name' do
        expect(response_data['data']['first_name']).to eq(@user.first_name)
      end

      it 'return the user last name' do
        expect(response_data['data']['last_name']).to eq(@user.last_name)
      end

      it 'return user role' do
        expect(response_data['data']['role']).to eq(@user.role)
      end
    end

    context 'to log a user out' do
      before do
        @user = FactoryBot.create(:user)
        post '/api/v1/auth/login', params: {
          user: {
            email: @user.email,
            password: @user.password
          }
        }
      end

      it 'log bearer token' do
        bearer_token = response.headers['Authorization'].split('Bearer ').last
        delete '/api/v1/auth/logout', headers: { 'Authorization' => "Bearer #{bearer_token}" }

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
