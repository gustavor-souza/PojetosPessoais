require 'rails_helper'

RSpec.describe Category, :type => :model do

  before{ @category = FactoryGirl.create(:category) }

  context "validates description" do
    it 'present' do
      @category.description = nil
      expect(@category).not_to be_valid
    end

    it 'minimum length' do
      @category.description = 'aaaa'
      expect(@category).not_to be_valid
    end

    it 'maximum length' do
      @category.description = 'a' * 31
      expect(@category).not_to be_valid
    end
  end
end
