require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'DELETE /payment' do
    let!(:payment) { FactoryBot.create(:payment) }

    before do
      delete "/api/v1/payments/#{payment.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
