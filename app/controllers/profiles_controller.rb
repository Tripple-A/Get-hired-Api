class ProfilesController < ApplicationController
    def create
    end

    def show
        render json: {
            id: params[:id]
        }
    end
end
