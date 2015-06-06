require 'rails_helper'

RSpec.describe "RegistrationCases", type: :request do

  before do
    visit root_path
    click_on('Cadastrar')
    @user = FactoryGirl.create(:user)
    fill_in(:user_name,                   with: @user.name)
    fill_in(:user_ddd,                    with: @user.ddd)
    fill_in(:user_phone,                  with: @user.phone)
    fill_in(:user_email,                  with: @user.email)
    fill_in(:user_password     ,          with: @user.password)
    fill_in(:user_password_confirmation,  with: @user.password)
  end

  context "failure" do

    before { click_on('Sign up') }

    it "email has been taken" do
      expect(page).to have_content('has already been taken')
    end

    it "shows the correct navigation links" do
      expect(page).not_to have_link('Sign out')
    end
  end

  context "success" do
    
    before do
      fill_in('user_email', with: 'valid_email@teste.com')
      click_on('Sign up')
    end

    it "displays a welcome message" do
      expect(page).to have_content('Bem vindo ao sistema Support Help, você está logado!')
    end

    it "shows the correct navigation links" do
      expect(page).to have_link('Sign out')
    end

    it "redirect to logged root path (where title == 'Tickets')" do
      expect(page).to have_title 'Tickets'
    end
  end
end
