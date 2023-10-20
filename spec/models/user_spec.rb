require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    subject { User.new(first_name: 'Spencer', last_name: 'Okyere', email: 'test@gmail.com', password: '123456') }

    before { subject.save }

    it 'first name should not blank' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'last name should not blank' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'email should have the right format' do
      subject.email = 'test'
      expect(subject).to_not be_valid
    end

    it 'first name should have a maximum of 25 characters' do
      subject.first_name = 'LoremipsumloremLoremipsumlorem'
      expect(subject).to_not be_valid
    end

    it 'last name should have a maximum of 25 characters' do
      subject.last_name = 'LoremipsumloremLoremipsumlorem'
      expect(subject).to_not be_valid
    end

    it 'subject to be valid' do
      user = User.create(
        first_name: 'drake',
        last_name: 'graham',
        email: 'drake@test.com',
        password: '123456'
      )
      expect(user).to be_valid
    end
  end
end
