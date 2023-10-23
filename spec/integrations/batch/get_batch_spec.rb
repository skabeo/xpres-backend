require 'rails_helper'

RSpec.describe 'Batch', type: :request do
  let(:response_data) { JSON.parse(response.body) }

  describe 'GET /batches' do
    before do
      FactoryBot.create_list(:batch, 9)
      get '/api/v1/batches'
    end

    it 'response should have 10 batch' do
      expect(response_data.size).to eq(10)
    end

    it 'should have status of success' do
      expect(response).to have_http_status(:success)
    end

    it 'should have content type of JSON' do
      expect(response.content_type).to start_with('application/json')
    end
  end
end
