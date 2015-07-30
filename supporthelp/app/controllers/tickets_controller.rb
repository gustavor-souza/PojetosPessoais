class TicketsController < ApplicationController
  before_action :set_ticket,  only: [:show, :edit, :destroy, :update_category,
  :update_priority, :valid_user, :get_in_charge]
  before_action :authenticate_user!
  before_action :valid_user, only: [:show]

  respond_to :html
  def index
    @search = Ticket.search do
      fulltext params[:search]
      if current_user.is_attendant?
        any_of do
          with(:incharge_id, 6)
          with(:incharge_id, nil)
        end
      else
        with(:creator_id, current_user.id)
      end
      paginate(:page => params[:page], :per_page => 10)
    end
    @tickets = @search.results
  end

  def show
  end

  def new
    @ticket = current_user.creator.build
  end

  def create
    @ticket = current_user.creator.build(ticket_params)
    if @ticket.save
      flash[:success] = 'Ticket criado com sucesso!'
      redirect_to @ticket
    else
      render new_ticket_path
    end
  end

  #####

  #Faz o update via patch da categoria do ticket
  def update_category
    @ticket.category_id = params[:ticket][:category_id]
    if @ticket.save!
      flash[:success] = 'Ticket reclassificado com sucesso!'
    else
      flash[:error] = 'Não foi possível reclassificar este ticket'
    end
    redirect_to @ticket
  end
  #Faz o update via patch da criticidade do ticket
  def update_priority
    @ticket.priority_id = params[:ticket][:priority_id]
    if @ticket.save!
      flash[:success] = 'Ticket reclassificado com sucesso!'
    else
      flash[:error] = 'Não foi possível reclassificar este ticket'
    end
    redirect_to @ticket
  end

  #chamado por ajax, faz o carregamento das categorias pelo parametro
  #system_id passado
  def fill_category_select
    @category_by_system = Category.where(system_id: params[:sent_id])
    render json: @category_by_system
  end

  def get_in_charge
    @ticket.incharge_id = current_user.id
    @ticket.save
    redirect_to @ticket
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def valid_user
    redirect_to :root unless current_user == @ticket.creator || current_user.is_attendant?
  end

  def ticket_params
    params.require(:ticket).permit(:description, :title, :sent_id, :system_id, :category_id, :priority_id, :status_id)
  end
end
