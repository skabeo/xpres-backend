require 'rails_helper'

RSpec.describe 'Category', type: :request do
  describe 'DELETE /api/v1/categories/:id' do
    let!(:category) { FactoryBot.create(:category) }

    before do
      @admin = FactoryBot.create(:user, role: 'admin')
      sign_in @admin

      delete "/api/v1/categories/#{category.id}"
    end

    it 'returns with 204 status' do
      expect(response).to have_http_status(204)
    end
  end
end
