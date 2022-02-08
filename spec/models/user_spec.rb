require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do
    it "Matches password and password confirmation" do
      @user = User.new(
        first_name: 'Joe',
        last_name: 'Smith',
        email: 'Test@test.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(@user.password).to eq(@user.password_confirmation)
      
    end

    it "fails if email already exist" do
      @user1 = User.new(
        first_name: 'Joe',
        last_name: 'Smith',
        email: 'Test@test.com',
        password: '12345',
        password_confirmation: '123'
      )
      @user1.save
      expect(@user1).to_not be_valid

    end

    it "fails when first name is not set" do
      @user2 = User.new(
        first_name: nil,
        last_name: 'Smith',
        email: 'Test34@test.com',
        password: '12233',
        password_confirmation: '12233'
      )

      expect(@user2).to_not be_valid
    end

    it "fails when last name is not set" do
      @user3 = User.new(
        first_name: 'Joe',
        last_name: nil,
        email: 'Test44@test.com',
        password: '12344',
        password_confirmation: '12344'
      )

      expect(@user3).to_not be_valid
    end

    it "fails when email is not set" do
      @user4 = User.new(
        first_name: 'Joe',
        last_name: 'Smith',
        email: nil,
        password: '123',
        password_confirmation: '123'
      )

      expect(@user4).to_not be_valid
    end

    it "Contains password with accepted length" do
      @user5 = User.new(
        first_name: 'Joe',
        last_name: 'Smith',
        email: 'a@a.com',
        password: '12',
        password_confirmation: '12'
      )
      
      expect(@user5).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it "ignores whitespaces" do
      @user = User.new(
        first_name: 'Joe',
        last_name: 'Smith',
        email: 'example@domain.com',
        password: '123',
        password_confirmation: '123'
      )
      @user.save

      user = User.authenticate_with_credentials(' example@domain.com ', '123')
      expect(user).to_not be(nil)
    end

    it "ignores uppercase and wrong case" do
      @user1 = User.new(
        first_name: 'Joe',
        last_name: 'Smith',
        email: 'example@example.com',
        password: '123',
        password_confirmation: '123'
      )
      @user1.save
      
      user1 = User.authenticate_with_credentials('eXaMPle@example.COM', '123')
      expect(user1).to_not be(nil)
    end

  end

end
