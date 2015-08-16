require 'rails_helper'

RSpec.describe "CommentCases", :type => :request do
  load "#{Rails.root}/db/seeds.rb"
  let(:user) { FactoryGirl.create(:user) }
  let(:user_attendant) { FactoryGirl.create(:user_attendant) }

  context "user" do
    let(:ticket) { FactoryGirl.create(:ticket, creator: user)}

    before do
      login_as(user, scope: :user)
      visit ticket_path(ticket.id)
    end

    describe 'comments' do
      before do
        fill_in(:comment_content,       with: 'Test new comment')
        click_button('Adicionar Comentário')
      end

      it{ expect(page).to have_css('.li-left-box') }

      it{ expect(page).to have_content('Test new comment') }

      it{ expect(page).to have_content('Em análise') }
    end
  end

  context "attendant" do
    let(:ticket) { FactoryGirl.create(:ticket, creator: user)}

    before do
      login_as(user_attendant, scope: :user)
      visit ticket_path(ticket.id)
    end

    context 'without anyone in charge' do
      before{ ticket.incharge = nil }

      it{ expect(page).not_to have_field('comment_content', type: 'textarea') }

      it{ expect(page).not_to have_selector('button', 'Adicionar Comentário') }
    end

    describe 'doing comments' do
      let(:ticket) { FactoryGirl.create(:ticket, creator: user, incharge: user_attendant)}
      before do
        fill_in(:comment_content,       with: 'Test new comment')
        click_button('Adicionar Comentário')
      end

      it{ expect(page).to have_css('.li-right-box') }

      it{ expect(page).to have_content('Test new comment') }

      it{ expect(page).to have_content('Aguardando resposta do usuário') }
    end
  end
end
