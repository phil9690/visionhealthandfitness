class Member < ApplicationRecord
  require 'csv'
	require "net/http"

  BASE_URL = 'http://sbctest.email'
  API_MAILBOX_URL = "#{BASE_URL}/api/v1/mailbox"

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      default_member_params = { consent_to_market_token: SecureRandom.hex(32) }
      row = row.to_hash.merge(default_member_params).symbolize_keys

			if row[:active] == 'active'
				row[:active] = true
			else
				row[:active] = false
			end
			
			Member.create(row)
    end
  end

	def gdpr_contact
		@member = self
		if email.present?
			MemberMailer.consent_to_market_email(@member).deliver
			sleep(2)
		elsif phone_number.present?
			send_gdpr_text_message
		end
	end

	def send_gdpr_text_message_1
		number = phone_number.dup
		number = number.prepend('44')

		message = "The laws on Data Protection are changing from 25th May. In line with GDPR - General Data Protection Regulations, we want to re-establish how you want us to use your information.\nTo stay updated on our Products"

		message = URI::encode(message)

		request_url = "https://www.textmarketer.biz/gateway/?username=eHUyUh&password=pdaRsx&message=#{message}&orig=VHF&number=#{number}"

		response = Net::HTTP.get_response(URI.parse(request_url))

		update(text_message_1_sent: true) if response.code == 200
	end

def send_gdpr_text_message_2
		number = phone_number.dup
		number = number.prepend('44')
		token = consent_to_market_token
		consent_url = "https://visionhealthandfitness.co.uk/members/#{token}"

		message = "and Services, please opt in by clicking the link below.\nYour information will not be shared with any third party and will only be used in line with our privacy policy\n\n#{consent_url}"

		message = URI::encode(message)

		request_url = "https://www.textmarketer.biz/gateway/?username=eHUyUh&password=pdaRsx&message=#{message}&orig=VHF&number=#{number}"

		response = Net::HTTP.get_response(URI.parse(request_url))

		update(text_message_2_sent: true) if response.code == 200
	end

	def send_gdpr_text_message
		send_gdpr_text_message_1
		sleep(2)
		send_gdpr_text_message_2
	end
end
