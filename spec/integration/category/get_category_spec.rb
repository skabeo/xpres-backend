require 'rails_helper'

RSpec.describe 'Category', type: :request do
  describe 'GET /categories' do
    let(:response_body) { JSON.parse(response.body) }
    before do
      get '/api/v1/categories'
    end

    it 'should have a success http status' do
      expect(response).to have_http_status(:success)
    end
  end
end
