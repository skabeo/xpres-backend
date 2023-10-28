require 'rails_helper'

RSpec.describe 'Review', type: :request do
  describe 'DELETE /review' do
    let(:user) { FactoryBot.create(:user, role: 'admin') }
    let(:review) { FactoryBot.create(:review) }

    before do
      sign_in user
      delete "/api/v1/reviews/#{review.id}"
    end

    it 'should have a no content status' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
