require 'rails_helper'

RSpec.describe Priority, :type => :model do
  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_least(1).is_at_most(50) }
  it { should have_many(:tickets) }
end
