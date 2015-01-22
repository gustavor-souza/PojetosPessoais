class AdminRolesController < ApplicationController
  before_action :set_admin_role, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_roles = AdminRole.all
    respond_with(@admin_roles)
  end

  def show
    respond_with(@admin_role)
  end

  def new
    @admin_role = AdminRole.new
    respond_with(@admin_role)
  end

  def edit
  end

  def create
    @admin_role = AdminRole.new(admin_role_params)
    @admin_role.save
    respond_with(@admin_role)
  end

  def update
    @admin_role.update(admin_role_params)
    respond_with(@admin_role)
  end

  def destroy
    @admin_role.destroy
    respond_with(@admin_role)
  end

  private
    def set_admin_role
      @admin_role = AdminRole.find(params[:id])
    end

    def admin_role_params
      params.require(:admin_role).permit(:user_id, :master)
    end
end
