class JobsController < ApplicationController
  before_action :find_job, only:[:edit, :show, :update, :destroy]

  def index
    @jobs = Job.all.order('created_at DESC')
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  def destroy
    if @job.destroy
      flash[:success] = "Job successfuly deleted"
    else
      flash[:success] = "Job cannot be deleted"
    end
    redirect_to root_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :descriptio, :company, :url)
  end

  def find_job
    @job = Job.find(params[:id])
  end

end
