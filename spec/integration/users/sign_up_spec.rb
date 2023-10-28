require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /api/v1/auth/signup' do
    context 'sign up' do
      before do
        post '/api/v1/auth/signup', params: {
          user: {
            first_name: 'Helli',
            last_name: 'Belli',
            email: 'hilli@gmail.com',
            password: '123456'
          }
        }
      end

      it 'should response of created' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
