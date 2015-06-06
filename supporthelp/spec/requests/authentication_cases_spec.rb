require 'rails_helper'

RSpec.describe "AuthenticationCases", type: :request do

    before do
      visit root_path
      click_on('Entrar')
    end

    context "failure" do
      before do
        fill_in('user_email', with: 'teste@teste.com')
        click_on('Log in')
      end

      it "displays an error message" do
        expect(page).to have_content('Usuário ou senha inválidos.')
      end

      it "shows the correct navigation links" do
        expect(page).not_to have_link('Sign out')
      end

      context "verify if unauthenticated user is unable to access forbidem pages - " do

        it "Tickets - tickets#index" do
          visit tickets_path
          expect(page.current_path).to eq new_user_session_path
        end

        it "New ticket - tickets#new" do
          visit new_ticket_path
          expect(page.current_path).to eq new_user_session_path
        end

        it "Show ticket - tickets#show" do
          ticket = FactoryGirl.create(:ticket)
          visit ticket_path(ticket)
          expect(page.current_path).to eq new_user_session_path
        end

      end

    end

    context "success" do
      before do
        @user = FactoryGirl.create(:user)
        fill_in('user_email', with: @user.email)
        fill_in('user_password', with: @user.password)
        click_on('Log in')
      end

      it "displays a welcome message" do
        expect(page).to have_content('Bem vindo!')
      end

      it "shows the correct navigation links" do
        expect(page).to have_link('Sign out')
      end

      it "Sign out successfuly" do
        login_as(@user, scope: :user)
        click_link('Sign out')
        expect(page).to have_content('Logout realizado com sucesso')
      end

      it "redirect to logged root path (where title == 'Tickets')" do
        expect(page).to have_title 'Tickets'
      end
    end
end
