require 'rails_helper'

RSpec.describe "StaticPagesCases", :type => :request do
  it 'Should redirect to about page' do
    visit root_path
    click_link "about"
  #  expect(page.current_path).to eq static_pages_about_path
  end
end
