require 'rails_helper'

RSpec.describe 'Batch', type: :request do
  describe 'DELETE /batch' do
    let(:batch) { FactoryBot.create(:batch) }

    before do
      delete "/api/v1/batches/#{batch.id}"
    end

    it 'should be deleted successfully' do
      expect(response).to have_http_status(204)
    end
  end
end
