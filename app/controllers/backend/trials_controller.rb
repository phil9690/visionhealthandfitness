module Backend
  class TrialsController < BaseController
    #GET /backend/trials
    def index
      @trials = Trial.all
    end

    #GET /backend/trials/:id
    def show
      @trial = Trial.find(params[:id])
    end

    #GET /backend/trials/new
    def new
      @trial = Trial.new
    end

    #POST /backend/trials
    def create
      @trial = Trial.new(trial_params)
      set_trial_status 
      if @trial.save
        TrialMailer.trial_message(@trial).deliver_now
        redirect_to trial_membership_thank_you_url
      end
    end

    #GET /backend/trials/:id/edit
    def edit
      @trial = Trial.find(params[:id])
    end

    #POST /backend/trials/:id
    def update
      @trial = Trial.find(params[:id])
      if @trial.update_attributes(trial_params)
        flash[:success] = "Trial updated"
        redirect_to @trial
      else
        render 'edit'
      end
    end

    #POST /backend/trials/:id
    def destroy
      Trial.find(params[:id]).destroy
      flash[:success] = "Trial deleted"
      redirect_to trials_url
    end

    def confirmation
    end

    private

      def trial_params
        params.require(:trial).permit(:first_name, :last_name, :email, :contact_number, :status)
      end

      def set_trial_status
        @trial.status = 'PENDING' if @trial.status.nil?
      end
  end
end
