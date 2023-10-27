require 'rails_helper'

RSpec.describe 'Product', type: :request do
  describe 'POST /api/vi/products' do
    let(:json) { JSON.parse(response.body) }
    let(:product) { FactoryBot.create(:product) }

    context 'only admins and create a product' do
      before do
        @user = FactoryBot.create(:user, role: 'admin')
        sign_in @user

        post '/api/v1/products', params: {
          product: {
            category_id: product.category_id,
            batch_id: product.batch_id,
            name: product.name,
            description: product.description,
            brand: product.brand,
            weight_kg: product.weight_kg,
            price: product.price,
            quantity: product.quantity
          }
        }
      end

      it 'have a created response' do
        p product.quantity.class
        expect(response).to have_http_status(:created)
      end

      it 'returns the name' do
        expect(json['name']).to eq(product.name)
      end

      it 'returns the description' do
        expect(json['description']).to eq(product.description)
      end

      it 'returns the brand' do
        expect(json['brand']).to eq(product.brand)
      end

      it 'returns the weight_kg' do
        expect(json['weight_kg']).to eq(product.weight_kg)
      end

      it 'returns the quantity' do
        expect(json['quantity']).to eq(product.quantity)
      end
    end

    context 'cant create a product as a normal user' do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user

        post '/api/v1/products', params: {
          product: {
            category_id: product.category_id,
            batch_id: product.batch_id,
            name: product.name,
            description: product.description,
            brand: product.brand,
            weight_kg: product.weight_kg,
            price: product.price,
            quantity: product.quantity
          }
        }
      end

      it 'should have a forbidden status' do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
