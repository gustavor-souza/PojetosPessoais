require 'rails_helper'

RSpec.describe "subjects/new", :type => :view do
  before(:each) do
    assign(:subject, Subject.new(
      :title => "MyString",
      :active => false,
      :System => ""
    ))
  end

  it "renders new subject form" do
    render

    assert_select "form[action=?][method=?]", subjects_path, "post" do

      assert_select "input#subject_title[name=?]", "subject[title]"

      assert_select "input#subject_active[name=?]", "subject[active]"

      assert_select "input#subject_System[name=?]", "subject[System]"
    end
  end
end
