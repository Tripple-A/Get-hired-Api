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
        status: 200,
        profile: user.profile
      }
    end
  end

  def show
    if !params[:id].include?('vendor')
    user = User.find(params[:id])
    profile = user.profile
    if profile.images.count.positive?
      images = profile.images
    else
      images = false
    end
    if user
    render json: {
      profile: user.profile,
      images: images
    }
    end
    else
      profile = Profile.find(params[:id].split('-')[1])
      render json: {
        vendor: profile,
        images: profile.images
      }
    end
  end

  private

  def profile_params
    params.permit(:company_name, :pitch, :location, :specialty, :user_id, :logo, :phone_number)
  end
end
