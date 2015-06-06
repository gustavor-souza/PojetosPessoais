require 'rails_helper'

RSpec.describe User, :type => :model do

  before{ @user = FactoryGirl.create(:user) }

  context "validates name" do
    it 'present' do
      @user.name = nil
      expect(@user).not_to be_valid
    end

    it 'minimum length' do
      @user.name = 'aaaa'
      expect(@user).not_to be_valid
    end

    it 'maximum length' do
      @user.name = 'a' * 601
      expect(@user).not_to be_valid
    end
  end

  context "validates email" do
    it 'present' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it 'is valid' do
      @user.email = 'test@test'
      expect(@user).not_to be_valid
    end
  end

  context "validates phone numbers" do
    it 'ddd present' do
      @user.ddd = nil
      expect(@user).not_to be_valid
    end

    it 'phone present' do
      @user.phone = nil
      expect(@user).not_to be_valid
    end

    it 'ddd length' do
      @user.ddd = '999'
      expect(@user).not_to be_valid
      @user.ddd = '9'
      expect(@user).not_to be_valid
      @user.ddd = '99'
      expect(@user).to be_valid
    end

    it 'phone length' do
      @user.phone = '9999999999'
      expect(@user).not_to be_valid
      @user.phone = '9999999'
      expect(@user).not_to be_valid
      @user.phone = '999999999'
      expect(@user).to be_valid
      @user.phone = '99999999'
      expect(@user).to be_valid
    end
  end



end
