require 'rails_helper'

RSpec.describe "StaticPagesCases", type: :request do

  context "When click, redirect to" do
    it 'about page' do
      visit root_path
      click_link "Sobre Nós"
      expect(page.current_path).to eq static_pages_about_path
    end

    it 'contact page' do
      visit root_path
      click_link "Contato"
      expect(page.current_path).to eq static_pages_contact_path
    end
  end
end
