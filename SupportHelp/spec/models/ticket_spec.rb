require 'rails_helper'

RSpec.describe Ticket, :type => :model do
  context "When it's created" do
    it "Should be valid" do
      expect(subject).not_to be_valid
    end
  end

  it "Should calculate time to response" do
    subject.created_at = Time.now - 1.days
    expect(subject.time_to_respond).to eq("24 horas para uma resposta")
  end
end
