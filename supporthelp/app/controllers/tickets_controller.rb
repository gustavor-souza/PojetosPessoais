class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def fill_category_select
    @category_by_system = Category.where(system_id: params[:sent_id])
    render json: @category_by_system
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.creator.build(ticket_params)
   if @ticket.save!
     redirect_to @ticket, notice: "Ticket criado com sucesso"
   else
     render :root, notice: "deu erro porra"
   end
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:description, :title, :sent_id, :system_id, :category_id, :priority_id, :status_id)
  end
end
