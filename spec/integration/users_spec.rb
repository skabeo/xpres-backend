require 'swagger_helper'

describe 'Users API' do
  path '/api/v1/auth/signup' do
    post 'Creates a new user' do
      tags 'Registation'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[first_name last_name email password]
      }

      response '200', 'User created' do
        run_test!
      end
    end
  end

  path '/api/v1/auth/login' do
    post 'User sign-in' do
      tags 'Sessions'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }

      response '200', 'User signed in' do
        run_test!
      end
    end
  end

  path '/api/v1/auth/logout' do
    delete 'User log-out' do
      tags 'Sessions'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token', required: true

      response '200', 'User logged out' do
        run_test!
      end
    end
  end
end
