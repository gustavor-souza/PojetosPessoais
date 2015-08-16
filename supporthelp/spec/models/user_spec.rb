require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(5).is_at_most(100) }
  it { should allow_value('user@example.com').for(:email )}
  it { should_not allow_value('userexample.com').for(:email )}
  it { should validate_presence_of(:ddd) }
  it { should validate_length_of(:ddd).is_equal_to(2) }
  it { should validate_presence_of(:phone) }
  it { should validate_length_of(:phone).is_at_least(8).is_at_most(9) }

  it { should belong_to(:company) }
  it { should have_many(:comments) }
  it { should have_many(:incharge).with_foreign_key('incharge_id') }
  it { should have_many(:creator).with_foreign_key('creator_id') }
end
