class CommentsController < ApplicationController
  def create
		@ticket = Ticket.find(params[:ticket_id])

    if current_user == @ticket.creator && !@ticket.canceled_or_finished?
      @ticket.status = Status.waiting
    elsif !@ticket.canceled_or_finished?
      @ticket.status = Status.waiting_for_user
    end

    @comment = @ticket.comments.build(params[:comment].permit(:content))
    @comment.user_id = current_user.id if current_user
    @ticket.save

    if @comment.save
      flash[:success] = "Comentário incluido com sucesso"
		else
			flash[:error] = "Não foi possível adicionar seu comentário"
		end
    redirect_to ticket_path(@ticket)
	end
end
