class AuditsController < ApplicationController

  def index
    if user_signed_in?
      @audits = Audit.paginate(page: params[:page], per_page: 10)
      @audit_id = params[:format].to_i
      @audit = Audit.new
    end
  end

  def new
    if user_signed_in?
      @audit = current_user.audits.build
    #  @audit_id = params[:format].to_i
    #  @audit = @audits.build
    #  @audit[:workout_id] = @audit_id
    end
  end

  def create
    @audit = current_user.audits.build(audit_params)
    assigned_workouts = Workout.find(params[:audit][:workout_ids]) rescue []
    @audit.workouts = assigned_workouts
    if @audit.save
      flash[:success] = "Audit was successfully created"
      redirect_to audits_path(@audit)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    if user_signed_in?
      @audit = Audit.find(params[:id])
      @workouts = @current_user.workouts
    end
  end

  def destroy
    @audit.destroy
    redirect_to root_path
  end

  private

  def audit_params
    params.require(:audit).permit(:name)
  end

end
