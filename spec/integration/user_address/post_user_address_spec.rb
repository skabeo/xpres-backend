require 'rails_helper'

RSpec.describe 'User address', type: :request do
  describe 'POST /api/v1/user_addresses' do
    let(:user) { FactoryBot.create(:user) }
    let(:user_address) { FactoryBot.create(:user_address) }
    let(:json) { JSON.parse(response.body) }

    before do
      sign_in user

      post '/api/v1/user_addresses', params: {
        user_address: {
          user_id: user_address.user_id,
          address: user_address.address,
          city: user_address.city,
          tel_line: user_address.tel_line,
          tel_line2: user_address.tel_line2
        }
      }
    end

    it 'have a created status' do
      expect(response).to have_http_status(:created)
    end

    it 'returns address' do
      expect(json['address']).to eq(user_address.address)
    end

    it 'returns city' do
      expect(json['city']).to eq(user_address.city)
    end

    it 'returns tel line 1' do
      expect(json['tel_line']).to eq(user_address.tel_line)
    end

    it 'returns tel line 2' do
      expect(json['tel_line2']).to eq(user_address.tel_line2)
    end
  end
end
