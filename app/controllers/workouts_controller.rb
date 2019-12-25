class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    if user_signed_in?
      @workouts = Workout.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page=>10)
    end
  end

  def show
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises.paginate(page: params[:page], per_page: 5)
    @exercise = Exercise.new
  end


  def new
    @workout = current_user.workouts.build
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      render 'new'
    end
  end

  def destroy
    @workout.destroy
    redirect_to root_path
  end

  def complete
    @workout = Workout.find(params[:id])
    @workout.update_attribute(:completed_at, Time.now)
    redirect_to root_path
  end

  private

  def workout_params
    params.require(:workout).permit(:title, :description)
  end

  def find_workout
    @workout = Workout.find(params[:id])
  end
end
