require 'rails_helper'

RSpec.describe Status, :type => :model do

  before{ @status = FactoryGirl.create(:status) }

  context "validates description" do
    it 'present' do
      @status.description = nil
      expect(@status).not_to be_valid
    end

    it 'minimum length' do
      @status.description = ''
      expect(@status).not_to be_valid
    end

    it 'maximum length' do
      @status.description = 'a' * 51
      expect(@status).not_to be_valid
    end
  end
end
