require 'swagger_helper'

describe 'Orders API' do
  path '/api/v1/orders' do
    get 'Retrieve all orders' do
      tags 'Orders'
      produces 'application/json'

      response '200', 'Orders retrieved successfully' do
        schema(type: :array)
        run_test!
      end

      response '403', 'Forbidden - Normal users cannot fetch orders of other users' do
        run_test!
      end
    end
  end

  path '/api/v1/orders' do
    post 'Create an order as an admin' do
      tags 'Orders'
      consumes 'application/json'
      parameter name: :order, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          product_id: { type: :integer },
          payment_id: { type: :integer },
          quantity: { type: :integer },
          total: { type: :number }
        },
        required: ['user_id', 'product_id', 'payment_id', 'quantity', 'total']
      }

      response '201', 'Order created successfully' do
        schema '$ref' => '#/definitions/order'
        run_test!
      end
    end
  end

  path '/api/v1/orders/{id}' do
    delete 'Delete an order' do
      tags 'Orders'
      parameter name: :id, in: :path, type: :integer, required: true

      response '204', 'Order deleted successfully' do
        run_test!
      end

      response '403', 'Forbidden - Normal users cannot delete orders' do
        run_test!
      end
    end
  end
end
