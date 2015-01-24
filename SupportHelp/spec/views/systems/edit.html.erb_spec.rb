require 'rails_helper'

RSpec.describe "systems/edit", :type => :view do
  before(:each) do
    @system = assign(:system, System.create!(
      :name => "MyString",
      :active => false
    ))
  end

  it "renders the edit system form" do
    render

    assert_select "form[action=?][method=?]", system_path(@system), "post" do

      assert_select "input#system_name[name=?]", "system[name]"

      assert_select "input#system_active[name=?]", "system[active]"
    end
  end
end
