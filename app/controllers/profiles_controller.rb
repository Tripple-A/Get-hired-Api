class ProfilesController < ApplicationController
    include CurrentUserConcern

    def create
        user = User.find(params[:id])
        profile = Profile.new(profile_params)
        profile.user_id = user.id
        if profile.save
        render json: {
          user: user,
          profile: profile
        }
        else render json: {
            status: 500,
            message: 'Profile not saved'
        }
        end
    end

    def show
        render json: {
            id: params[:id]
        }
    end

    private
    def profile_params 
        params.permit(:company_name,:pitch,:location,:specialty,:id)
    end

end
