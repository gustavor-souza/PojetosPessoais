require 'rails_helper'

RSpec.describe "systems/new", :type => :view do
  before(:each) do
    assign(:system, System.new(
      :name => "MyString",
      :active => false
    ))
  end

  it "renders new system form" do
    render

    assert_select "form[action=?][method=?]", systems_path, "post" do

      assert_select "input#system_name[name=?]", "system[name]"

      assert_select "input#system_active[name=?]", "system[active]"
    end
  end
end
