class StaticPagesController < ApplicationController
  layout 'register_interest', only: [:cramlington]

  def home
    @trial = Trial.new
  end

  def privacy_policy
  end

	def cookie_policy
	end

  def contact
  end

  def classes
  end

  def memberships
  end

  def timetables
  end

  def ab_solution
  end

  def bootcamp
  end

  def boxing
  end

  def circuit_training
  end

  def cycle_fit
  end

  def cycle_pump
  end

  def hiit
  end

  def kettle_x_fit
  end

  def lbt
  end

  def mma
  end

  def pilates
  end

  def pilates_hiit
  end

  def pumped
  end

  def rig_assault
  end

  def strength_and_conditioning
  end

  def total_body
  end

  def trx
  end

  def ultimate_endurance
  end

  def vhf_code_of_conduct
  end

  def cramlington
  end

  def cramlington_register_lead_interest
    lead = cramlington_register_interest_params
    gibbon = Gibbon::Request.new
    member = gibbon.lists('044cf090f6').members.create(
      body: {
        email_address: lead[:email_address],
        status: "subscribed",
        merge_fields: {
          FNAME: lead[:first_name],
          LNAME: lead[:last_name],
          MOBILE: lead[:contact_number],
          ECONSENT: boolean_mapping[lead[:email_consent]],
          TCONSENT: boolean_mapping[lead[:text_consent]]
        }
      }
    )

    respond_to do |format|
      format.js { render 'static_pages/register_interest_confirmation'}
    end

  rescue Gibbon::MailChimpError => e
    require 'pry'; binding.pry
    flash[:alert] = "#{e.detail}"
    redirect_to cramlington_path
  end

  def register_interest_confirmation
  end

  def cramlington_register_interest_params
    params.require(:lead).permit(:first_name, :last_name, :email_address, :contact_number, :email_consent, :text_consent)
  end

	private

	def boolean_mapping
		{
			"0" => 'NO',
			"1" => 'YES'
		}
	end
end
