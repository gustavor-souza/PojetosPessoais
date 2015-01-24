require 'rails_helper'

RSpec.describe "priorities/new", :type => :view do
  before(:each) do
    assign(:priority, Priority.new(
      :description => "MyString"
    ))
  end

  it "renders new priority form" do
    render

    assert_select "form[action=?][method=?]", priorities_path, "post" do

      assert_select "input#priority_description[name=?]", "priority[description]"
    end
  end
end
