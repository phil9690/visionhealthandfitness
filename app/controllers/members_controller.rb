class MembersController < ApplicationController
  def consent_to_market
    token = params[:consent_to_market_token]
    @member = Member.find_by(consent_to_market_token: token)
  end

  def set_consent_to_market
    token = params[:consent_to_market_token]
    @member = Member.find_by(consent_to_market_token: token)

    if @member
      @member.consent_to_market = params[:member][:consent_to_market]
      @member.consent_to_market_token = nil
      @member.consent_to_market_ip_address = request.remote_ip
      require 'pry'; binding.pry
      @member.consent_to_market_date = Time.zone.now
      @member.save
    end

    redirect_to root_path
  end

  private

  def consent_to_market_params
   Params.require(:member).permit(:consent_to_market_token)
  end
end
