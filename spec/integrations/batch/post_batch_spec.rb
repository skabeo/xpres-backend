require 'rails_helper'

RSpec.describe 'Batch', type: :request do
  describe 'POST /batches' do
    let(:response_data) { JSON.parse(response.body) }

    context 'post batch with valid parameters' do
      let(:batch) { FactoryBot.create(:batch) }
      before do
        post '/api/v1/batches', params: {
          batch: {
            batch_number: batch.batch_number,
            start_date: batch.start_date,
            end_date: batch.end_date,
            shipping_cost: batch.shipping_cost
          }
        }
      end

      it 'returns the batch number' do
        expect(response_data['batch_number']).to eq(batch.batch_number)
      end

      it 'returns the start date' do
        expect(response_data['start_date']).to eq(batch.start_date.strftime('%Y-%m-%d'))
      end

      it 'returns the end date' do
        expect(response_data['end_date']).to eq(batch.end_date.strftime('%Y-%m-%d'))
      end

      it 'returns the shipping cost' do
        expect(response_data['shipping_cost']).to eq(batch.shipping_cost)
      end
    end

    context 'creating a batch with invalid parameters' do
      before do
        post '/api/v1/batches', params: {
          batch: {
            batch_number: '',
            start_date: '',
            end_date: '',
            shipping_cost: ''
          }
        }
      end

      it 'should have a 401 staus' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
