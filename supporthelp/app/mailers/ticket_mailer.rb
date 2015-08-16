#utiliza o action mailer e renderiza o email de acordo com a view
class TicketMailer < ActionMailer::Base
  default from: 'teste@teste.net'
  def ticket_finished_email(ticket)
    @ticket = ticket
    mail({
      :to => ticket.creator_email,
      :subject => I18n.t('ticket_mailer.ticket_finished_email.subject', ticket_id: ticket.id)
    })
  end
end
