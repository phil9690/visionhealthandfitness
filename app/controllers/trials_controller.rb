class TrialsController < ApplicationController
  def new
    @trial = Trial.new
  end

  def create
    @trial = Trial.new(trial_params)
    set_trial_status 
    if @trial.save
      TrialMailer.trial_message(@trial).deliver_now
      redirect_to trial_membership_thank_you_path
    end
  end

  def confirmation
  end

  private

    def trial_params
      params.require(:trial).permit(:first_name, :last_name, :email, :contact_number, :status)
    end

    def set_trial_status
      @trial.status = 'PENDING'
    end

end
