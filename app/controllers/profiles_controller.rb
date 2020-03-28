class ProfilesController < ApplicationController
    include CurrentUserConcern
 
    def index 
       vendors = Profile.all 
       render json: {
           status: 'ok',
           vendors: vendors
       }
    end

    def create
        user = User.find(params[:user_id])
        if !user.profile
        profile = Profile.new(profile_params)
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
        params.permit(:company_name,:pitch,:location,:specialty,:user_id)
    end

end
