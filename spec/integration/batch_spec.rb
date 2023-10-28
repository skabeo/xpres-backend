require 'swagger_helper'

describe 'Batches API' do
  path '/api/v1/batches' do
    get 'Retrieves all batches' do
      produces 'application/json'

      response '200', 'successful' do
        schema(type: :object, properties: {
          data: {
            type: :array,
            items: {
              '$ref' => '#/definitions/batch'
            }
          }
        })

        run_test!
      end
    end
  end
end
