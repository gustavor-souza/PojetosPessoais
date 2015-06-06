require 'rails_helper'

RSpec.describe Comment, :type => :model do

  before{ @comment = FactoryGirl.create(:comment) }

  context "validates content" do
    it 'has content' do
      @comment.content = nil;
      expect(@comment).not_to be_valid
    end

    it 'minimum length' do
      @comment.content = 'aaaa'
      expect(@comment).not_to be_valid
    end

    it 'maximum length' do
      @comment.content = 'a' * 601
      expect(@comment).not_to be_valid
    end
  end
end
