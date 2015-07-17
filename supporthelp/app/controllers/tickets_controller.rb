class TicketsController < ApplicationController
  before_action :set_ticket,  only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html
  def index
    @search = Ticket.by_creator(current_user.id).search do
      fulltext params[:search]
      paginate(:page => params[:page], :per_page => 10)
    end
    @tickets = @search.results
  end

  def show
  end

  def fill_category_select
    @category_by_system = Category.where(system_id: params[:sent_id])
    render json: @category_by_system
  end

  def new
    @ticket = current_user.creator.build
  end

  def create
    @ticket = current_user.creator.build(ticket_params)
    if @ticket.save
      flash[:success] = "Ticket criado com sucesso!"
      respond_with(@ticket)
    else
      render new_ticket_path
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
