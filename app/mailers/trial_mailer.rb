class TrialMailer < ApplicationMailer

  default to: 'memberships@visionhealthandfitness.co.uk'

  def trial_message(trial)
    @trial = trial
    mail(from: trial.email, reply_to: trial.email, subject: "Trial membership for #{trial.first_name} #{trial.last_name}")
  end

end
