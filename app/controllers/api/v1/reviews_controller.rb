class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: %i[show update destroy]

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews.to_json(include: %i[user product])
  end

  # GET /reviews/1
  def show
    render json: @review.to_json(include: %i[user product])
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    authorize! :update, @review

    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    authorize! :destroy, @review
    
    @review.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:user_id, :product_id, :rating, :comment)
  end
end
