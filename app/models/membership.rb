class Membership < ApplicationRecord
  belongs_to :membership_option

 def process_payment
    customer = Stripe::Customer.create email: email,
                                       source: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: membership_option.price*100,
                          description: "#{membership_option.name.titleize}",
                          currency: 'gbp'

  end

end
