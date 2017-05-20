module Backend
  class MembershipsController < BaseController
    # GET /backend/memberships
    def index
      @memberships = Membership.all
    end

    # GET /backend/memberships/new
    def new
      @membership_options = MembershipOption.all
      @membership = Membership.new
    end

    # GET /backend/memberships/:id
    def show
      @membership = Membership.find(params[:id])
    end

    def destroy
      Membership.find(params[:id]).destroy
      flash[:success] = "Membership deleted"
      redirect_to backend_memberships_url
    end
  end
end
