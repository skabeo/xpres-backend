require 'rails_helper'

RSpec.describe 'Order', type: :request do
  describe 'DELETE /orders' do
    let(:order) { FactoryBot.create(:order) }

    context 'normal users cant delete an order' do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user

        delete "/api/v1/orders/#{order.id}"
      end

      it 'have a success status' do
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'admin users can delete orders' do
      before do
        @user = FactoryBot.create(:user, role: 'admin')
        sign_in @user

        delete "/api/v1/orders/#{order.id}"
      end

      it 'should have a no content status' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
