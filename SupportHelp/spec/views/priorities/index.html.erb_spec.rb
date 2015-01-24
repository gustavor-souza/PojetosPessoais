require 'rails_helper'

RSpec.describe "priorities/index", :type => :view do
  before(:each) do
    assign(:priorities, [
      Priority.create!(
        :description => "Description"
      ),
      Priority.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of priorities" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
