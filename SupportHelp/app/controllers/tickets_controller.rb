class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html,:js, :json

  def index
    @tickets = Ticket.by_user(current_user.id)
    respond_with(@tickets)
  end

  def show
    respond_with(@ticket)
  end

  def new
    @system = System.actives
    @priority = Priority.actives
    @subject = Subject.all
    @ticket = Ticket.new
    @ticket.comments.build
    respond_to :js, :html
  end

  def remote
    @subject = Subject.filter_system(params[:system_id])
    render json: @subject
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    unless current_user.analyst?
      @ticket.status_id = Status.first.id
    end
    @ticket.save
    respond_with(@ticket)
  end

  def update
    @ticket.update(ticket_params)
    respond_with(@ticket)
  end

  def destroy
    @ticket.destroy
    respond_with(@ticket)
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:title, :system_id, :subject_id, :priority_id, :client_id, comments_attributes: [:content, :user_id])
    end
end
