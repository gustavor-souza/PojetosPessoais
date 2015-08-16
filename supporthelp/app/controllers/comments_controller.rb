#controller dos comentários
class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.create_comment(current_user, comment_attributes)
    if @comment.save
      flash[:success] = "Comentário incluido com sucesso"
    else
      flash[:error] = "Não foi possível adicionar seu comentário"
    end
    redirect_to ticket_path(@ticket)
  end

  private

  def comment_attributes
    params[:comment].permit(:content)
  end
end
