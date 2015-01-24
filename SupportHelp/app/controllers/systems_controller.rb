class SystemsController < ApplicationController
  before_action :set_system, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @systems = System.all
    respond_with(@systems)
  end

  def show
    respond_with(@system)
  end

  def new
    @system = System.new
    respond_with(@system)
  end

  def edit
  end

  def create
    @system = System.new(system_params)
    @system.save
    respond_with(@system)
  end

  def update
    @system.update(system_params)
    respond_with(@system)
  end

  def destroy
    @system.destroy
    respond_with(@system)
  end

  private
    def set_system
      @system = System.find(params[:id])
    end

    def system_params
      params.require(:system).permit(:name, :active)
    end
end
