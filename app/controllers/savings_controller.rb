class SavingsController < ApplicationController

  def create
    saving = Saving.new(savings_params)
    if saving.save 
        return json: {
            status: 200,
            message: 'vendor saved'
        }
    else
        return json: {
            status: 500
        }
    end
  end  

  def show 
    user = User.find(params[:id])
    if user.potential_vendors.count.positive?
        return json: {
            status: 200,
            saved_vendors: user.potential_vendors
        }
    else
        return json: {
            status: 200,
            saved_vendors: nil
        }
    end
  end

  private

  def savings_params
    params.permit.require(:potential_customer_id, :potential_vendor_id)
  end
end
