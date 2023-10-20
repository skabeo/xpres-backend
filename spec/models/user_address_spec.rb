require 'rails_helper'

RSpec.describe UserAddress, type: :model do
  describe 'User address model' do
    user = User.create(first_name: 'Eug', last_name: 'basa', email: 'jane@doe.com', password: '123456')
    user_address = UserAddress.create(
      user_id: user.id,
      address: 'B10140/12 Obonu street',
      city: 'Acra',
      tel_line: '0507690136',
      tel_line2: '0244104094'
    )

    it 'address should not be blank' do
      user_address.address = nil
      expect(user_address).to_not be_valid
    end

    it 'city should not be blank' do
      user_address.city = nil
      expect(user_address).to_not be_valid
    end

    it 'tel_line should not be blank' do
      user_address.tel_line = nil
      expect(user_address).to_not be_valid
    end

    it 'tel_line2 can be blank' do
      user = User.create(first_name: 'Eug', last_name: 'basa', email: 'jane2@doe.com', password: '123456')
      user_address = UserAddress.create(
        user_id: user.id,
        address: 'B10140/12 Obonu street',
        city: 'Acra',
        tel_line: '0507690136',
        tel_line2: nil
      )
      expect(user_address).to be_valid
    end

    it 'address should have maximum 30 characters' do
      user_address.address = 'Lorem Ipsum lorem ipsum lorem ipsum'
      expect(user_address).to_not be_valid
    end

    it 'city should have maximum 30 characters' do
      user_address.city = 'Lorem Ipsum lorem ipsum lorem ipsum'
      expect(user_address).to_not be_valid
    end

    it 'tel_line should have maximum 10 characters' do
      user_address.tel_line = '05516993211'
      expect(user_address).to_not be_valid
    end
  end
end
