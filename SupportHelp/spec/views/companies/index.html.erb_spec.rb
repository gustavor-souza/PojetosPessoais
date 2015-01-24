require 'rails_helper'

RSpec.describe "companies/index", :type => :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :title => "Title"
      ),
      Company.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
