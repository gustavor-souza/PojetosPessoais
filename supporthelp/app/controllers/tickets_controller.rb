#controller dos tickets (principal)
class TicketsController < ApplicationController
  before_action :set_ticket,  only: [:show, :edit, :destroy, :update_category,
  :update_priority, :valid_user, :get_in_charge, :cancel_or_finish, :ticket_reopen]

  before_action :authenticate_user!
  before_action :valid_user,         only: [:show]

  respond_to :html

  def index
    @search = do_search(params[:status_id], current_user.id)
    @tickets = @search.results
  end

  def show
  end

  def new
    @ticket = current_user.creator.build
  end

  def create
    @ticket = current_user.creator.build(ticket_params)
    if @ticket.define_open_status_and_save
      flash[:success] = 'Ticket criado com sucesso!'
      redirect_to @ticket
    else
      render new_ticket_path
    end
  end

  #####

  #Faz o update via patch da categoria do ticket
  def update_category
    @ticket.update(ticket_params)
    flash[:success] = 'Ticket reclassificado com sucesso!'
    redirect_to @ticket
  end
  #Faz o update via patch da criticidade do ticket
  def update_priority
    @ticket.update(ticket_params)
    flash[:success] = 'Ticket reclassificado com sucesso!'
    redirect_to @ticket
  end

  #chamado por ajax, faz o carregamento das categorias pelo parametro
  #system_id passado
  def fill_category_select
    @category_by_system = Category.where(system_id: params[:sent_id])
    render json: @category_by_system
  end

  def get_in_charge
    @ticket.incharge = current_user
    @ticket.define_waiting_status
    @ticket.save
    redirect_to @ticket
  end

  def cancel_or_finish
    @ticket.cancel_or_finish(current_user.id, params[:commit])
    flash[:alert] = "Ticket #{@ticket.status_description}"

    MailingWorker.perform_async(@ticket.id) if @ticket.finished?

    redirect_to @ticket
  end

  def ticket_reopen
    @ticket.define_waiting_status
    msg = "Ticket reaberto por: #{current_user.name}"
    @ticket.create_automatic_comment_and_save(current_user.id, msg)
    flash[:success] = 'Ticket reaberto com sucesso!'
    redirect_to @ticket
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def do_search(status_id, current_user_id)
    Ticket.search do
      if current_user.attendant?
        any_of do
          with(:incharge_id, current_user_id)
          with(:incharge_id, nil)
        end
      else
        with(:creator_id, current_user_id)
      end
      fulltext params[:search]
      with(:status_id, status_id) if status_id
      paginate(page: params[:page], per_page: 10)
    end
  end

  def valid_user
    redirect_to :root unless current_user == @ticket.creator || current_user.attendant?
  end

  def ticket_params
    params.require(:ticket).permit(:description, :title, :sent_id, :system_id,
    :category_id, :priority_id, :status_id)
  end
end
