require 'rails_helper'

RSpec.describe User, :type => :model do
    it "Should be valid" do
      expect(subject).not_to be_valid
    end
end
