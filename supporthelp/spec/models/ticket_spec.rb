require 'rails_helper'

RSpec.describe Ticket, :type => :model do
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_least(5).is_at_most(50) }
  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_least(5).is_at_most(600) }
  it { should have_many(:comments) }
  it { should belong_to(:system) }
  it { should belong_to(:category) }
  it { should belong_to(:status) }
  it { should belong_to(:priority) }
  it { should belong_to(:creator).class_name(:User) }
  it { should belong_to(:incharge).class_name(:User) }

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
