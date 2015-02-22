require 'rails_helper'

RSpec.describe System, :type => :model do
  context "Whe it's created" do
    it "Should be valid" do
      expect(subject).not_to be_valid
    end
  end
end
