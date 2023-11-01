require 'swagger_helper'

describe 'Payments API' do
  path '/api/v1/payments' do
    get 'Retrieve all payments' do
      tags 'Payments'

      response '200', 'Admin can view all payments' do
        run_test!
      end

      response '403', 'Access restricted as a normal user' do
        run_test!
      end

      response '401', 'User should be unauthorized when not signed in' do
        run_test!
      end
    end
  end

  path '/api/v1/payments' do
    post 'Create a payment' do
      tags 'Payments'

      parameter name: :payment, in: :body, schema: {
        type: :object,
        properties: {
          provider: { type: :string },
          status: { type: :string },
          ref: { type: :string },
          amount: { type: :number, format: :float }
        },
        required: %w[provider status ref amount]
      }

      response '201', 'Payment created' do
        schema type: :object,
               properties: {
                 provider: { type: :string },
                 status: { type: :string },
                 ref: { type: :string },
                 amount: { type: :number, format: :float }
               }

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        schema type: :object,
               properties: {
                 errors: {
                   type: :object,
                   properties: {
                     provider: { type: :array, items: { type: :string } },
                     status: { type: :array, items: { type: :string } },
                     ref: { type: :array, items: { type: :string } },
                     amount: { type: :array, items: { type: :string } }
                   }
                 }
               }

        run_test!
      end
    end
  end

  path '/api/v1/payments/{id}' do
    parameter name: :id, in: :path, type: :string

    delete 'Delete a payment' do
      tags 'Payments'

      response '204', 'Payment deleted' do
        run_test!
      end

      response '403', 'Forbidden' do
        run_test!
      end
    end
  end
end
