require 'rails_helper'

RSpec.describe 'Product', type: :request do
  describe 'GET /products' do
    before do
      get '/api/v1/products'
    end

    it 'should a success status' do
      expect(response).to have_http_status(:success)
    end
  end
end
