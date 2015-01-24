require 'rails_helper'

RSpec.describe "subjects/show", :type => :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      :title => "Title",
      :active => false,
      :System => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
