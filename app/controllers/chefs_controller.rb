class ChefsController < ApplicationController
    def index
        chefs = Chef.all 
        render json: {status: 200, chefs: chefs}
        
    end
end
