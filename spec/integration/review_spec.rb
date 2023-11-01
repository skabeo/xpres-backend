require 'swagger_helper'

describe 'Reviews API' do
  path '/api/v1/reviews' do
    get 'Retrieves all reviews' do
      tags 'Reviews'

      response '200', 'Reviews retrieved' do
        run_test!
      end
    end
  end

  path '/api/v1/reviews' do
    post 'Creates a review' do
      tags 'Reviews'

      parameter name: :review, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          product_id: { type: :integer },
          rating: { type: :number },
          comment: { type: :string }
        },
        required: %w[user_id product_id rating comment]
      }

      response '201', 'Review created' do
        let(:review) { FactoryBot.build(:review) }

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

  path '/api/v1/reviews/{id}' do
    parameter name: :id, in: :path, type: :integer, description: 'Review ID'

    delete 'Deletes a review' do
      tags 'Reviews'

      response '204', 'No Content' do
        let(:user) { FactoryBot.create(:user, role: 'admin') }
        let(:review) { FactoryBot.create(:review) }

        before do
          sign_in user
          delete "/api/v1/reviews/#{review.id}"
        end

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
end
