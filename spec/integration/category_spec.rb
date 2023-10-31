require 'swagger_helper'

describe 'Categories API' do
  path '/api/v1/categories' do
    get 'Retrieves all categories' do
      tags 'Categories'
      produces 'application/json'

      response '200', 'successful' do
        schema(type: :object, properties: {
          data: {
            type: :array
          }
        })

        run_test!
      end
    end
  end

  path '/api/v1/categories' do
    post 'Create a category' do
      tags 'Categories'
      consumes 'application/json'
      parameter name: :category, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'category created' do
        let(:category) { { name: 'hey' } }
        run_test! do
          expect(JSON.parse(response.body)['name']).to eq('hey')
        end
      end

      response '422', 'unprocessable entity' do
        let(:category) { { name: nil } }
        run_test!
      end
    end
  end

  path '/api/v1/categories/{id}' do
    delete 'Delete a category' do
      tags 'Categories'
      parameter name: :id, in: :path, type: :string
      consumes 'application/json'

      response '204', 'category deleted' do
        run_test!
      end

      response '404', 'category not found' do
        let(:id) { 'non_existent_id' }
        run_test!
      end
    end
  end
end
