require 'rails_helper'

RSpec.describe "systems/index", :type => :view do
  before(:each) do
    assign(:systems, [
      System.create!(
        :name => "Name",
        :active => false
      ),
      System.create!(
        :name => "Name",
        :active => false
      )
    ])
  end

  it "renders a list of systems" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
