# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static#home'
  resources :sessions, only: [:create]
  resources :registrations, only: %i[create show]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  post :add, to: 'registrations#add_image'
  resources :profiles
  resources :images
  resources :chefs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
