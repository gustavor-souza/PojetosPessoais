require 'rails_helper'

RSpec.describe Priority, :type => :model do

  before{ @priority = FactoryGirl.create(:priority) }

  context "validates description" do
    it 'present' do
      @priority.description = nil
      expect(@priority).not_to be_valid
    end

    it 'minimum length' do
      @priority.description = ''
      expect(@priority).not_to be_valid
    end

    it 'maximum length' do
      @priority.description = 'a' * 16
      expect(@priority).not_to be_valid
    end
  end
end
