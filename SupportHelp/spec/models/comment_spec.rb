require 'rails_helper'

describe Comment do

  context "when it's created" do

    it "Should be valid" do
      expect(subject).not_to be_valid
    end
  end
end
