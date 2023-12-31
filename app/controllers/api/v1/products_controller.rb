class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]

  # GET /products
  def index
    @products = Product.all

    # products_images = @products.map do |product|
    #   if product.images.attached?
    #     product.as_json.merge(image: url_for(product.images))
    #   else
    #     product.as_json.merge(images: [])
    #   end
    # end

    render json: @products.to_json(include: %i[category batch])
  end

  # GET /products/1
  def show
    render json: @product.to_json(include: %i[category batch])
    # if @product.images.attached?
    #   render json: @product.as_json.merge(images: url_for(@product.image))
    # else
    #   render json: @product.as_json.merge(images: nil)
    # end
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    authorize! :create, @product
    if @product.save
      render json: @product, status: :created, location: api_v1_product_path(@product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    authorize! :create, @product

    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    authorize! :destroy, @product

    @product.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(
      :category_id,
      :batch_id, :name,
      :description,
      :brand,
      :weight_kg,
      :price,
      :quantity,
      images: []
    )
  end
end
