require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'POST /orders' do
    let(:response_data) { JSON.parse(response.body) }

    context 'create an order as an admin' do
      let(:order) { FactoryBot.create(:order) }

      before do
        @user = FactoryBot.create(:user)
        sign_in @user

        post '/api/v1/orders', params: {
          order: {
            user_id: order.user_id,
            product_id: order.product_id,
            payment_id: order.payment_id,
            quantity: order.quantity,
            total: order.total
          }
        }
      end

      it 'have a created http response' do
        expect(response).to have_http_status(:created)
      end

      it 'returns  the quantity' do
        expect(response_data['quantity']).to eq(order.quantity)
      end

      it 'returns the total amount' do
        expect(response_data['total']).to eq(order.total)
      end
    end
  end
end
