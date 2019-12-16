class ExercisesController < ApplicationController
 before_action :find_exercise, only: [:show, :edit, :update, :destroy]
 # before_action :authenticate_user!, except: [:index]

  def index
    if user_signed_in?
      @exercises = Exercise.where(:workout_id => params[:format].to_i).paginate(:page => params[:page], :per_page=>10)
      @workout_id = params[:format].to_i
    end
  end

  def new
    if user_signed_in?
      @exercises = Exercise.where(:workout_id => params[:format].to_i).paginate(:page => params[:page], :per_page=>10)
      @workout_id = params[:format].to_i
    end
    @exercise = @exercises.build
    @exercise[:workout_id] = @workout_id
  end

  def show
  end

  def create
    # puts "in create #{@workout_id}"
    # full_ex_params = exercise_params
    # full_ex_params[:workout_id] = @workout_id
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to root_path
    else
      render 'new'
    end
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
    params.require(:exercise).permit(:title, :description, :workout_id)
  end

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end

end
