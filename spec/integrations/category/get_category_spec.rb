require 'rails_helper'

RSpec.describe 'Category', type: :request do
  describe 'GET /categories' do
    let(:response_body) { JSON.parse(response.body) }
    before do
      FactoryBot.create_list(:category, 1)

      get '/api/v1/categories'
    end

    it 'should have 2 size' do
      expect(response_body.size).to eq(3)
    end

    it 'should have a success http status' do
      expect(response).to have_http_status(:success)
    end
  end
end
