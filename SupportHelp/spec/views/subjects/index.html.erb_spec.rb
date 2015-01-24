require 'rails_helper'

RSpec.describe "subjects/index", :type => :view do
  before(:each) do
    assign(:subjects, [
      Subject.create!(
        :title => "Title",
        :active => false,
        :System => ""
      ),
      Subject.create!(
        :title => "Title",
        :active => false,
        :System => ""
      )
    ])
  end

  it "renders a list of subjects" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
