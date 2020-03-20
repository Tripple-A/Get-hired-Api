# frozen_string_literal: true

class RegistrationsController < ApplicationController
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
    user = User.find(params[:id])
    user.update_attribute(:vendor, true)
    render json: {
      user: user
    }

  end

  private 
  def reg_params
    params.permit(:email, :password, :password_confirmation)
  end
end
