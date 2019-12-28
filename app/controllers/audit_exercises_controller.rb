class AuditExercisesController < ApplicationController

  def index
    @audit_exercises = AuditExercise.new
  end

  def new
    @audit_exercise = audit_exercises.build
  end

  def create
    @audit_exercise = audit_exercises.build(audit_exercises_params)
    if @audit_exercise.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def audit_exercises_params
    params.require(:audit_exercise).permit(:complete, :comment)
  end

end