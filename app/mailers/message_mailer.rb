class MessageMailer < ApplicationMailer

  def contact(message)
    @body = message.body

    mail to: "memberships@visionhealthandfitness.co.uk", from: message.email
  end

end
