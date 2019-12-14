class ExercisesController < ApplicationController
before_action :find_exercise, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @exercises = Exercise.where(:workout_id => current_user.id).paginate(:page => params[:page], :per_page=>10)
    end
  end

  def new
    @exercise = current_user.exercises.build
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercise_path(@exercise)
    else
      render 'new'
    end
  end

  def destroy
    @exercise.destroy
    redirect_to root_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:title, :description)
  end

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end

end
