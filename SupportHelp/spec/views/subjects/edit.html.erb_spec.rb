require 'rails_helper'

RSpec.describe "subjects/edit", :type => :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      :title => "MyString",
      :active => false,
      :System => ""
    ))
  end

  it "renders the edit subject form" do
    render

    assert_select "form[action=?][method=?]", subject_path(@subject), "post" do

      assert_select "input#subject_title[name=?]", "subject[title]"

      assert_select "input#subject_active[name=?]", "subject[active]"

      assert_select "input#subject_System[name=?]", "subject[System]"
    end
  end
end
