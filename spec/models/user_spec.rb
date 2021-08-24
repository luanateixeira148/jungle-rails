require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'validates if password and password_confirmation match' do
      @user = User.new(name: 'New Test Name', email: 'test@test.com', password: 'passtest', password_confirmation: 'passtest')
      expect(@user).to_be_valid
    end 

    it 'fails if password and password_confirmation dont match' do
      @user = User.new(name: 'New Test Name', email: 'test@test.com', password: 'passtest', password_confirmation: 'passtestnotmach')
      expect(@user).to_not_be_valid
    end 

    it 'fails if password is empty' do
      @user = User.new(name: 'New Test Name', email: 'test@test.com', password: nil, password_confirmation: 'passtest')
      expect(@user).to_not_be_valid
    end 

    it 'fails if email already exists in the db' do
      @user1 = User.new(name: 'New Test Name', email: 'test@test.com', password: 'passtest', password_confirmation: 'passtest')
      expect(@user1).to_not_be_valid
      @user2 = User.new(name: 'New Test Name', email: 'test@test.com', password: 'passtest', password_confirmation: 'passtest')
      expect(@user2).to_not_be_valid
    end 

    it 'fails if email is empty' do
      @user = User.new(name: 'New Test Name', email: nil, password: 'passtest', password_confirmation: 'passtest')
      expect(@user).to_not_be_valid
    end 

    it 'fails if password is shorter than 6 characters' do
      @user = User.new(name: 'New Test Name', email: 'test@test.com', password: 'pass', password_confirmation: 'pass')
      expect(@user).to_not_be_valid
    end

  end

  describe '.autenticate_with_credentials' do

    it 'logs in if email and password are correct'
    
      @user = User.new(name: 'New Test Name', email: 'test@test.com', password: 'passtest', password_confirmation: 'passtest')
      expect(User.autenticate_with_credentials('test@test.com', 'passtest').to eq(@user))
  
    end

    it 'fails if email is incorrect'
    
      @user = User.new(name: 'New Test Name', email: 'test@test.com', password: 'passtest', password_confirmation: 'passtest')
      expect(User.autenticate_with_credentials('wrongtest@test.com', 'passtest').to eq(nil))

    end

    it 'fails if password is incorrect'
    
      @user = User.new(name: 'New Test Name', email: 'test@test.com', password: 'passtest', password_confirmation: 'passtest')
      expect(User.autenticate_with_credentials('test@test.com', 'wrongpass').to eq(nil))

    end

  end

end
