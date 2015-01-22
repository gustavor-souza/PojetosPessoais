require 'rails_helper'

RSpec.describe "admin_roles/show", :type => :view do
  before(:each) do
    @admin_role = assign(:admin_role, AdminRole.create!(
      :user => nil,
      :master => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
