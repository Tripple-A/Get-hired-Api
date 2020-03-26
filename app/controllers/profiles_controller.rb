class ProfilesController < ApplicationController
    include CurrentUserConcern

    def create
        user = @current_user
        if !user.profile
        profile = Profile.new(profile_params)
        profile.user_id = @current_user.id
        if profile.save
        render json: {
          status: 200,
          profile: profile
        }
        else render json: {
            status: 500,
            message: 'Profile not saved'
        }
      end
    else redirect_to action: "change"
        end
    end

    def show
        render json: {
            id: params[:id]
        }
    end

    def change 
        render json: {
            message: 'you exist'
        }
    end

    private
    def profile_params 
        params.permit(:company_name,:pitch,:location,:specialty,:id)
    end

end
