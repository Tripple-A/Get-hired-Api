# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static#home'
  resources :sessions, only: [:create]
  resources :registrations, only: [:create, :show]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  resources :profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
