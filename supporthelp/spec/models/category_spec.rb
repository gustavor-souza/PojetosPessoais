require 'rails_helper'

RSpec.describe Category, :type => :model do
  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_least(5).is_at_most(30) }
  it { should belong_to(:system) }
  it { should have_many(:tickets) }
end
