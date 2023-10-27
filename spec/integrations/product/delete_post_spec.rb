require 'rails_helper'

RSpec.describe 'Product', type: :request do
  describe 'DELETE /products' do
    let(:product) { FactoryBot.create(:product) }

    context 'only admins can delete a product' do
      before do
        @user = FactoryBot.create(:user, role: 'admin')
        sign_in @user

        delete "/api/v1/products/#{product.id}"
      end

      it 'should have no content status' do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'normal users cant delete a product' do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user

        delete "/api/v1/products/#{product.id}"
      end

      it 'should have a forbidden status' do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
