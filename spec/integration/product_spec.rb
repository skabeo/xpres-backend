require 'swagger_helper'

describe 'Products API' do
  path '/api/v1/products' do
    get 'Retrieves all products' do
      tags 'Products'

      response '200', 'Products retrieved' do
        run_test!
      end
    end
  end

  path '/api/v1/products' do
    post 'Creates a product' do
      tags 'Products'

      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          category_id: { type: :integer },
          batch_id: { type: :integer },
          name: { type: :string },
          description: { type: :string },
          brand: { type: :string },
          weight_kg: { type: :number },
          price: { type: :number },
          quantity: { type: :integer }
        },
        required: %w[category_id batch_id name description brand weight_kg price quantity]
      }

      response '201', 'Product created' do
        let(:product) { FactoryBot.build(:product) }

        run_test!
      end

      response '403', 'Forbidden' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        run_test!
      end
    end
  end

  path '/api/v1/products/{id}' do
    parameter name: :id, in: :path, type: :string

    delete 'Deletes a product' do
      tags 'Products'

      response '204', 'Product deleted' do
        let(:product) { FactoryBot.create(:product) }

        run_test!
      end

      response '403', 'Forbidden' do
        run_test!
      end
    end
  end
end
