require 'rails_helper'

RSpec.describe 'Category', type: :request do
  describe 'POST /categories' do
    let(:response_body) { JSON.parse(response.body) }
    context 'with valid parameters' do
      before do
        post '/api/v1/categories', params: {
          category: {
            name: 'hey'
          }
        }
      end

      it 'should return name' do
        expect(response_body['name']).to eq('hey')
      end
    end
  end
end
