require 'rails_helper'

RSpec.describe System, :type => :model do

  before{ @system = FactoryGirl.create(:system) }

  context "validates description" do
    it 'present' do
      @system.description = nil
      expect(@system).not_to be_valid
    end

    it 'minimum length' do
      @system.description = ''
      expect(@system).not_to be_valid
    end

    it 'maximum length' do
      @system.description = 'a' * 16
      expect(@system).not_to be_valid
    end
  end
end
