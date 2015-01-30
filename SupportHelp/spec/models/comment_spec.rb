require 'rails_helper'

describe Comment do
  context "when its created" do

    it "Should have a user" do
      com = Comment.new(content: "bla bla bla", ticket_id: 1, user_id: 1 )
      expect(com.ticket_id).to eq(1)
    end

  end
end
