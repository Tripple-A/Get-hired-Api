# frozen_string_literal: true

class RegistrationsController < ApplicationController
  include CurrentUserConcern
  def create
    user = User.new(reg_params)
    if user.save
      session[:user_id] = user.id
      render json: {
        status: 'created',
        logged_in: true,
        user: user
      }
    else
      render json: {
        status: 500,
        errors: user.errors
      }
    end
  end

  def show
    user = @current_user
    user.update_attribute(:vendor, true)
    render json: {
      status: 'ok',
      user: user
    }

  end

  

  private 
  def reg_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
