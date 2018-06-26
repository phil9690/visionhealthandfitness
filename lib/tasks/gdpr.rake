namespace :gdpr do
  desc 'Sends gdpr email or text message to member'
  task send_message: :environment do
    Member.all.each do |member|
      member.gdpr_contact
    end 
  end
end

