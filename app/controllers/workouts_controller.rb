class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all.order("created_at DESC")
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:title, :description)
  end

end
