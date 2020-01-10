class AuditExercisesController < ApplicationController

  def index
    @audit_exercises = AuditExercise.new
  end

  def new
    @audit_exercises = Notice.new
    @audit_exercises.entity_roles.build(name: 'submitter').build_entity
  end

  def create
    @audit_exercise = AuditExercise.new(audit_exercises_params)
    @audit_exercise.save
      redirect_to root_path
    end

    def show

    end

  private

  def audit_exercises_params
    params.require(:audit_exercise).permit(:complete, :comment)
  end

end