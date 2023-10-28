class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy]
  before_action :authenticate_user!

  # GET /orders
  def index
    if current_user.admin?
      @orders = Order.all
    else
      @orders = Order.where(user_id: current_user.id)
    end

    render json: @orders.to_json(include: %i[user product payment])
  end

  # GET /orders/1
  def show
    authorize! :read, @order
    
    render json: @order.to_json(include: %i[user product payment])
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: api_v1_order_path(@order)
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    authorize! :destroy, @order
    @order.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:user_id, :product_id, :payment_id, :quantity, :total)
  end
end
