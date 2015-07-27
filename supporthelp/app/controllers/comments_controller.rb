class CommentsController < ApplicationController
  def create
		@ticket = Ticket.find(params[:ticket_id])
		@comment = @ticket.comments.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id if current_user
		@comment.save

    if @comment.save!
      flash[:success] = "Comentário incluido com sucesso"
		else
			flash[:error] = "Não foi possível adicionar seu comentário"
		end
    redirect_to ticket_path(@ticket)
	end
end
