class Membership < ApplicationRecord
  belongs_to :membership_option

  before_save { email.downcase! }

  validates :title, :first_name, :last_name, :dob, :phone_number, :address_line_1, :city, :post_code, :membership_option_id, :terms_accepted, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  validate :is_over_16

 def is_over_16
  unless (dob + 16.years) <= Date.today
    errors.add(:dob, "You must be 16 years or older to buy this membership")
  end
 end

 def process_payment
    customer = Stripe::Customer.create email: email,
                                       source: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: membership_option.price*100,
                          description: "#{membership_option.name.titleize}",
                          currency: 'gbp'

  end

end
