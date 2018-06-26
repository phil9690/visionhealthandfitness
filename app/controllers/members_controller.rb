class MembersController < ApplicationController
  def consent_to_market
    token = params[:consent_to_market_token]
    @member = Member.find_by(consent_to_market_token: token)

    if @member
      @member.consent_to_market = true
      @member.consent_to_market_ip_address = request.remote_ip
      @member.consent_to_market_date = Time.zone.now
      @member.save
      redirect_to consent_accepted_path(@member.consent_to_market_token)
    else
      redirect_to root_path
    end
  end

  def set_consent_to_market
    token = params[:consent_to_market_token]
    @member = Member.find_by(consent_to_market_token: token)

    if @member
      @member.consent_to_market = params[:member][:consent_to_market]
    end

    redirect_to root_path
  end

  def consent_accepted
    token = params[:consent_to_market_token]
    @member = Member.find_by(consent_to_market_token: token)
    if @member
      @member.consent_to_market_token = nil
      @member.save
      render 'consent_accepted'
    else
      redirect_to root_path
    end
  end

  def import
    Member.import(params[:file])
    redirect_to root_url
  end

  private

  def consent_to_market_params
   Params.require(:member).permit(:consent_to_market_token)
  end
end
