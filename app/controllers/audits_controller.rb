class AuditsController < ApplicationController

  def index
    @audits = Audit.paginate(page: params[:page], per_page: 10)
    @audit_id = params[:format].to_i
    @audit = Audit.new
  end

  def new
    @audit = Audit.new
    @audit_id = params[:format].to_i
  #  @audit = @audits.build
    @audit[:workout_id] = @audit_id
  end

  def create
    @audit = Audit.new(audit_params)
    if @audit.save
      flash[:success] = "Audit was successfully created"
      redirect_to audit_path(@audit)
    else
      render 'new'
    end
  end

  private

  def audit_params
    params.require(:audit)
  end

end
