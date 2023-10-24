class Api::V1::PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show update destroy]
  before_action :authenticate_user!

  # GET /payments
  def index
    @payments = Payment.all

    authorize! :read, @payments
    render json: @payments.to_json(include: [:user])
  end

  # GET /payments/1
  def show
    authorize! :read, @payment

    render json: @payment.to_json(include: [:user])
  end

  # POST /payments
  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      render json: @payment, status: :created, location: api_v1_payment_path(@payment)
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payments/1
  def update
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payments/1
  def destroy
    authorize! :destroy, @payment

    @payment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:provider, :status, :ref, :amount)
  end
end
