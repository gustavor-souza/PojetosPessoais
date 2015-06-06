require 'rails_helper'

RSpec.describe Ticket, :type => :model do
  before{ @ticket = FactoryGirl.create(:ticket) }

  context "validates title" do
    it 'present' do
      @ticket.title = nil
      expect(@ticket).not_to be_valid
    end

    it 'minimum length' do
      @ticket.title = 'aaaa'
      expect(@ticket).not_to be_valid
    end

    it 'maximum length' do
      @ticket.title = 'a' * 601
      expect(@ticket).not_to be_valid
    end
  end

  context "validates description" do
    it 'present' do
      @ticket.description = nil
      expect(@ticket).not_to be_valid
    end

    it 'minimum length' do
      @ticket.description = 'aaaa'
      expect(@ticket).not_to be_valid
    end

    it 'maximum length' do
      @ticket.description = 'a' * 601
      expect(@ticket).not_to be_valid
    end
  end
end
