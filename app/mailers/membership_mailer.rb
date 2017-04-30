class Membership < ApplicationMailer
  default to: 'memberships@visionhealthandfitness.co.uk'

  def member_membership_confirmation_message(membership)
    @membership = membership
    mail(to: membership.email from: 'memberships@visionhealthandfitness.co.uk', reply_to: 'memberships@visionhealthandfitness.co.uk', subject: "Membership for #{membership.first_name} #{membership.last_name}")
  end

  def gym_membership_confirmation_message(membership)
    @membership = membership
    mail(from: 'admin@visionhealthandfitness.co.uk', reply_to: 'memberships@visionhealthandfitness.co.uk', subject: "New membership registered for #{membership.first_name} #{membership.last_name}"
  end
end
