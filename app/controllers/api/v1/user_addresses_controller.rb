class Api::V1::UserAddressesController < ApplicationController
  before_action :set_user_address, only: %i[show update destroy]

  # GET /user_addresses
  def index
    @user_addresses = UserAddress.all

    # @user_addresses = UserAddress.includes(:image_attachment).all
    # render json: @user_addresses, each_serializer: UserAddressSerializer

    user_addresses_images = @user_addresses.map do |user_address|
      if user_address.image.attached?
        user_address.as_json.merge(image: url_for(user_address.image))
      else
        user_address.as_json.merge(image: nil)
      end
    end

    render json: user_addresses_images
  end

  # GET /user_addresses/1
  def show
    render json: @user_address
  end

  # POST /user_addresses
  def create
    @user_address = UserAddress.new(user_address_params)

    if @user_address.save
      render json: @user_address, status: :created, location: @user_address
    else
      render json: @user_address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_addresses/1
  def update
    if @user_address.update(user_address_params)
      render json: @user_address
    else
      render json: @user_address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_addresses/1
  def destroy
    @user_address.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_address
    @user_address = UserAddress.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_address_params
    params.require(:user_address).permit(:user_id, :address, :city, :tel_line, :tel_line2 :image)
  end
end
