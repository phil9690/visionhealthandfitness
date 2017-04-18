class TrialsController < ApplicationController

  def index
    @trials = Trial.all
  end

  def show
    @trial = Trial.find(params[:id])
  end

  def new
    @trial = Trial.new
  end

  def create
    @trial = Trial.new(trial_params)
    require 'pry'; binding.pry
    set_trial_status 
    if @trial.save
      TrialMailer.trial_message(@trial).deliver_now
    end
  end

  def edit
    @trial = Trial.find(params[:id])
  end

  def update
    @trial = Trial.find(params[:id])
    if @trial.save
      redirect_to trial_path(@trial)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

    def trial_params
      params.require(:trial).permit(:first_name, :last_name, :email, :contact_number, :status)
    end

    def set_trial_status
      @trial.status = 'PENDING' if @trial.status.nil?
    end

end
