class MessageMailer < ApplicationMailer
  def contact(message)
    @body = message.body
    message_to = "#{message.gym.downcase}@visionhealthandfitness.co.uk"
    mail(to: message_to, from: message.email, reply_to: message.email, subject: "Web enquiry from #{message.name}")
  end
end
