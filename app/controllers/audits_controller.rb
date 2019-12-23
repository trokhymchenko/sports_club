class AuditsController < ApplicationController
  before_action :find_audit, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @audits = Audit.paginate(page: params[:page], per_page: 10)
    end
  end

  def new
    if user_signed_in?
      @audit = current_user.audits.build
    end
  end

  def create
    if user_signed_in?
      @audit = current_user.audits.build(audit_params)
      if @audit.save
        flash[:success] = "Audit was successfully created"
        redirect_to audits_path(@audit)
      else
        render 'new'
      end
    end
  end

  def edit
  end

  def show
    if user_signed_in?
      @audit = Audit.find(params[:id])
    end
  end

  def update
    if @audit.update(audit_params)
      redirect_to audit_path(@audit)
    else
      render 'new'
    end
  end

  def destroy
    @audit.destroy
    redirect_to audits_path
  end

  private

  def audit_params
    params.require(:audit).permit(:name, workout_ids: [])
  end

  def find_audit
    @audit = Audit.find(params[:id])
  end

end
