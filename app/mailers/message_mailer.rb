class MessageMailer < ApplicationMailer

  default to: 'memberships@visionhealthandfitness.co.uk'

  def contact(message)
    @body = message.body
    mail(from: message.email, reply_to: message.email, subject: "Web enquiry from #{message.name}")
  end
end
