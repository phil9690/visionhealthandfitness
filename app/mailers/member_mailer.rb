class MemberMailer < ApplicationMailer
  default from: 'compliance@visionhealthandfitness.co.uk'

  def consent_to_market_email(member)
    @member = member
    email = member.email
    mail(to: email, from: 'compliance@visionhealthandfitness.co.uk', reply_to: 'compliance@visionhealthandfitness.co.uk', subject: "The law is changing. Opt-in now to stay in touch!")
  end
end
