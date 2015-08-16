require 'rails_helper'

#screenshot_and_save_page para evidenciar cenários
RSpec.describe "TicketCases", type: :request do
  load "#{Rails.root}/db/seeds.rb"
  let(:user){FactoryGirl.create(:user)}
  let(:user_attendant){FactoryGirl.create(:user_attendant)}
  let(:ticket){FactoryGirl.create(:ticket, creator: user)}

  context "user" do
    before{login_as(user, scope: :user)}
    it 'creates new ticket' do
      visit new_ticket_path
      fill_in(:ticket_title,       with: 'Teste teste')
      #Valores dos selects acordo com o seeds.rb
      select('Sistema 2',                                    from: :ticket_system_id)
      select('Solicitar Criação de usuário',                 from: :ticket_category_id)
      select('Impacto nas atividades sem saida de contorno', from: :ticket_priority_id)
      fill_in(:ticket_description, with: 'Teste teste')
      click_button('Criar Ticket')
      expect(page).to have_content('Ticket criado com sucesso')
    end


    it 'cancel the ticket' do
      visit ticket_path(ticket.id)
      click_button('Cancelar')
      expect(page).to have_content('Cancelado')
    end

    context 'attendant' do
      before do
        ticket.system = System.first
        ticket.save
        login_as(user_attendant, scope: :user)
        visit ticket_path(ticket.id)
      end

      it 'get incharge' do
        click_button('atender')
        expect(page).to have_content('Em análise')
      end

      it 'close the ticket' do
        click_button('atender')
        click_button('Encerrar')
        expect(page).to have_content('Encerrado')
        expect(page).to have_content('Ticket Encerrado')
      end

      it "change ticket's category" do
        select('Mensagem de erro', from: :ticket_category_id)
        click_button('change_category')
        expect(page).to have_content('Ticket reclassificado com sucesso!')
      end

      it "change ticket's priority" do
        select('Sem impacto em produção', from: :ticket_priority_id)
        click_button('change_priority')
        expect(page).to have_content('Ticket reclassificado com sucesso!')
      end

      it 'reopen the ticket' do
        click_button('atender')
        click_button('Encerrar')
        click_button('Reabrir')
        expect(page).to have_content('Em análise')
        expect(page).to have_content('Ticket reaberto com sucesso!')
      end
    end
  end
end
