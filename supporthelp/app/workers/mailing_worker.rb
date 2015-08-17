class MailingWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(ticket_id)
    TicketMailer.ticket_finished_email(ticket_id).deliver_now 
  end
end
