require 'rails_helper'

RSpec.describe "StaticPagesCases", :type => :request do
  it 'Should redirect to about page' do
    visit root_path
    click_link "Sobre Nós"
    expect(page.current_path).to eq static_pages_about_path
  end

  it 'Should redirect to sobre page' do
    visit root_path
    click_link "Contato"
    expect(page.current_path).to eq static_pages_contact_path
  end
end
