class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout, notice: "workout successfuly created"
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :workout, :mood, :length)
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

end
