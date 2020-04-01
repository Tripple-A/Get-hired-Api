# frozen_string_literal: true

class ProfilesController < ApplicationController
  include CurrentUserConcern

  def index
    vendors = Profile.all
    render json: {
      status: 200,
      vendors: vendors
    }
  end

  def create
    user = User.find(params[:user_id])
    if !user.profile && user.vendor
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
    else
      user.profile.update(profile_params)
      render json: {
        message: 'profile updated',
        profile: user.profile
      }
    end
  end

  def show
    user = User.find(params[:id])
    profile = user.profile
    if profile.images.count > 0
      images = profile.images
    else
      images = null
    end
    if user
    render json: {
      profile: user.profile,
      images: images
    }
    end
  end

  private

  def profile_params
    params.permit(:company_name, :pitch, :location, :specialty, :user_id, :logo)
  end
end
