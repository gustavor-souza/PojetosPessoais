require 'rails_helper'

RSpec.describe "admin_roles/index", :type => :view do
  before(:each) do
    assign(:admin_roles, [
      AdminRole.create!(
        :user => nil,
        :master => false
      ),
      AdminRole.create!(
        :user => nil,
        :master => false
      )
    ])
  end

  it "renders a list of admin_roles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
