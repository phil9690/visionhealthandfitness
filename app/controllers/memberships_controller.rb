class MembershipsController < ApplicationController
  # GET /memberships
  def index
    @membership_options = MembershipOption.all
  end

  # GET /memberships/new
  def new
    @membership_options = MembershipOption.all
    @membership = Membership.new
  end

  # POST /memberships
  def create
    @membership_options = MembershipOption.all
    params[:membership_option] = membership_params[:membership_option_id]
    @membership = Membership.new(membership_params)

    raise "Please, check membership errors" unless @membership.valid?
    @membership.process_payment
    @membership.save
    MembershipMailer.member_membership_confirmation_message(@membership).deliver_now
    MembershipMailer.gym_membership_confirmation_message(@membership).deliver_now
    redirect_to memberships_thank_you_path
  rescue Exception => e
    flash[:error] = e.message
    render :new
  end

  def confirmation
  end

  private

  def membership_params
    params.require(:membership).permit(:title,
                                       :first_name,
                                       :last_name,
                                       :dob,
                                       :phone_number,
                                       :email,
                                       :address_line_1,
                                       :address_line_2,
                                       :city,
                                       :post_code,
                                       :card_token,
                                       :membership_option_id,
                                       :terms_accepted)
  end
end
