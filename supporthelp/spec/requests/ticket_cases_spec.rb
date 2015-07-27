require 'rails_helper'

RSpec.describe "TicketCases", :type => :request do

    before do
      visit root_path
      click_on('Entrar')
      @user = FactoryGirl.create(:user)
      fill_in('user_email', with: @user.email)
      fill_in('user_password', with: @user.password)
      click_on('Log in')
    end

  context "creates" do
    it 'new ticket' do
      load "#{Rails.root}/db/seeds.rb"
      visit new_ticket_path
      fill_in(:ticket_title,       with: 'Teste teste')
      #Valores dos selects acordo com o seeds.rb
      select('Sistema 2',                                    from: :ticket_system_id)
      select('Solicitar Criação de usuário',                 from: :ticket_category_id)
      select('Impacto nas atividades sem saida de contorno', from: :ticket_priority_id)
      select('Aberto',                                       from: :ticket_status_id)
      fill_in(:ticket_description, with: 'Teste teste')
      click_button('Criar Ticket')
      expect(page).to have_content('Ticket criado com sucesso')
    end
  end
end
