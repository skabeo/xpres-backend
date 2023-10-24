require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'DELETE /payment' do
    context 'can delete any payment when user is an admin' do
      let!(:payment) { FactoryBot.create(:payment) }

      before do
        @user = FactoryBot.create(:user, role: 'admin')
        sign_in @user
  
        delete "/api/v1/payments/#{payment.id}"
      end
  
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'can not delete any payment when user is not admin' do
      let!(:payment) { FactoryBot.create(:payment) }
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
        
        delete "/api/v1/payments/#{payment.id}"
      end

      it 'should have http response of forbidden' do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
