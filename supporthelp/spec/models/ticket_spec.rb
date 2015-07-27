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

  context "sunspot",  :search => true  do
    it 'search success' do
      @ticket_pass1 = FactoryGirl.create(:ticket_search_pass1)
      @ticket_pass2 = FactoryGirl.create(:ticket_search_pass2)
      Sunspot.commit
      expect(Ticket.search { keywords "teste passou"}.results).to eq([@ticket_pass1,@ticket_pass2 ])
    end

    it 'search not found' do
      @ticket_not_pass = FactoryGirl.create(:ticket_search_not_pass)
      Sunspot.commit
      expect(Ticket.search { keywords "teste passou"}.results).not_to eq([@ticket_not_pass])
    end
  end
end
