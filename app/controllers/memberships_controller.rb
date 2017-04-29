class MembershipsController < ApplicationController


  def new
    @membership_options = MembershipOption.all
    @membership = Membership.new
  end

  def show
    @membership = Membership.find(params[:id])
  end

  # POST /memberships
  def create
    @membership = Membership.new(membership_params)

    raise "Please, check membership errors" unless @membership.valid?
    @membership.process_payment
    @membership.save
    redirect_to @membership, notice: 'Membership was successfully created.'
  rescue Exception => e
    flash[:error] = e.message
    render :new
  end

  private

  def membership_params
    params.require(:membership).permit(:first_name, :last_name, :phone_number, :email, :card_token, :membership_option_id)
  end

end
