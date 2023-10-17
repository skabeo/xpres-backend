require 'test_helper'

class UserAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_address = user_addresses(:one)
  end

  test 'should get index' do
    get user_addresses_url, as: :json
    assert_response :success
  end

  test 'should create user_address' do
    assert_difference('UserAddress.count') do
      post user_addresses_url,
           params: { user_address: { address: @user_address.address, city: @user_address.city, tel_line: @user_address.tel_line, tel_line2: @user_address.tel_line2, user_id: @user_address.user_id } }, as: :json
    end

    assert_response :created
  end

  test 'should show user_address' do
    get user_address_url(@user_address), as: :json
    assert_response :success
  end

  test 'should update user_address' do
    patch user_address_url(@user_address),
          params: { user_address: { address: @user_address.address, city: @user_address.city, tel_line: @user_address.tel_line, tel_line2: @user_address.tel_line2, user_id: @user_address.user_id } }, as: :json
    assert_response :success
  end

  test 'should destroy user_address' do
    assert_difference('UserAddress.count', -1) do
      delete user_address_url(@user_address), as: :json
    end

    assert_response :no_content
  end
end
