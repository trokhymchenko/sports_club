class ExercisesController < ApplicationController
 before_action :find_exercise, only: [:show, :edit, :update, :destroy]

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
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      respond_to do |format|
        format.js
        format.json { render json: @exercise, status: :created }
        end
    else
      render 'new'
    end
  end

  def edit
  end

 def update
   if @exercise.update(exercise_params)
     redirect_to exercise_path(@exercise) unless params[:commit] == 'Update Exercise'
   else
     render 'new'
   end
 end

 def complete
   @exercise = Exercise.find(params[:id])
   @exercise.update_attribute(:completed_at, Time.now)
   redirect_to controller: "workouts", action: "show", id: @exercise.workout_id
 end

  def destroy
    if @exercise.destroy
    redirect_to controller: "workouts", action: "show", id: @exercise.workout_id
    end
  end

  private

 def exercise_params
   params.require(:exercise).permit(:title, :description, :workout_id, :complete, :comment)
 end

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end

end
