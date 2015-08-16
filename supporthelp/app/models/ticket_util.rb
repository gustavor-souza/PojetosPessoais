module TicketUtil
  def create_comment(current_user, params)
    comment = self.comments.build(params)
    comment.user_id = current_user.id if current_user
    change_ticket_state_after_comment(current_user)
    self.save
    comment
  end

  def change_ticket_state_after_comment(current_user)
    canceled_or_finished = !self.canceled_or_finished?
    if current_user == self.creator && canceled_or_finished
      self.status = Status.waiting
    elsif canceled_or_finished
      self.status = Status.waiting_for_user
    end
  end

  def create_automatic_comment_and_save(user_id, message = nil)
    message ||= "Ticket #{self.status_description} por #{User.find(user_id).name}"
    self.comments.build(content: message, user_id: user_id, is_automatic: true )
    self.save
  end

  def cancel_or_finish(user_id, commit)
    if commit == 'Cancelar'
      self.status_id = Status.canceled.pluck(:id).first
    elsif commit == 'Encerrar'
      self.status_id = Status.finished.pluck(:id).first
    end
    self.create_automatic_comment_and_save(user_id)
  end
end
