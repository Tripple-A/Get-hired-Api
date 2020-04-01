class ImagesController < ApplicationController

    def create 
       id = User.find(params[:user_id]).profile.id
       image = Image.new(:url => params[:url], :title => params[:title])
       image.profile_id = id
       if image.save 
        render json: {
            status: 'success'
        }
       else render json: {
           status: 'failure'
       } 
       end
    end

    private
    def image_params
        params.require.permit(:user_id, :url, :title)
    end
end
