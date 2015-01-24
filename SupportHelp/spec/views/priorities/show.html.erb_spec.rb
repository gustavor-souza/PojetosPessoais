require 'rails_helper'

RSpec.describe "priorities/show", :type => :view do
  before(:each) do
    @priority = assign(:priority, Priority.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
