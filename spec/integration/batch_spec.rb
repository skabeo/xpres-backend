require 'swagger_helper'

describe 'Batches API' do
  path '/api/v1/batches' do
    get 'Retrieves all batches' do
      tags 'Batches'
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

  path '/api/v1/batches' do
    post 'Creates a batch' do
      tags 'Batches'
      consumes 'application/json'
      parameter name: :batch, in: :body, schema: {
        type: :object,
        properties: {
          batch_number: { type: :number },
          start_date: { type: :string, format: :date },
          end_date: { type: :string, format: :date },
          shipping_cost: { type: :number }
        },
        required: %w[batch_number start_date end_date shipping_cost]
      }

      response '201', 'Batch created' do
        let(:batch) do
          {
            batch_number: 5,
            start_date: '2023-10-25',
            end_date: '2023-10-28',
            shipping_cost: 10.0
          }
        end
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:batch) do
          {
            batch_number: '',
            start_date: '',
            end_date: '',
            shipping_cost: ''
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/batches/{id}' do
    parameter name: :id, in: :path, type: :integer

    delete 'Deletes a batch' do
      tags 'Batches'

      response '204', 'Batch deleted' do
        run_test!
      end
    end
  end
end
