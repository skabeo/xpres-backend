require 'rails_helper'

RSpec.describe 'Payment', type: :request do
  let(:response_body) { JSON.parse(response.body) }

  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:payment) { FactoryBot.create(:payment) }

      before do
        @admin_user = FactoryBot.create(:user, role: 'admin')
        sign_in @admin_user

        post '/api/v1/payments', params: {
          payment: {
            provider: payment.provider,
            status: payment.status,
            ref: payment.ref,
            amount: payment.amount
          }
        }
      end

      it 'returns the provider' do
        expect(response_body['provider']).to eq(payment.provider)
      end

      it 'returns the status' do
        expect(response_body['status']).to eq(payment.status)
      end

      it 'returns the ref' do
        expect(response_body['ref']).to eq(payment.ref)
      end

      it 'returns the amount' do
        expect(response_body['amount']).to eq(payment['amount'])
      end

      it 'have created http status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
        
        post '/api/v1/payments', params: {
          payment: {
            provider: '',
            status: '',
            ref: '',
            amount: ''
          }
        }
      end

      it 'response should be invalid' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
