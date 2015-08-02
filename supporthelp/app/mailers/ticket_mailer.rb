class TicketMailer < ActionMailer::Base
  default from: 'teste@teste.net'
  def ticket_finished_email(ticket)
    @ticket = ticket
    @confirmation_link = tickets_url # Mudaremos no futuro
    mail({
      :to => ticket.creator.email,
      :subject => I18n.t('ticket_mailer.ticket_finished_email.subject', ticket_id: ticket.id)
    })
  end
end
