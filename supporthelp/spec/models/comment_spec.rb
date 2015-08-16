require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it { should validate_presence_of(:content) }
  it { should validate_length_of(:content).is_at_least(5).is_at_most(600) }
  it { should belong_to(:user) }
  it { should belong_to(:ticket) }
end
