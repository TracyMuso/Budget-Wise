# frozen_string_literal: true

Rails.application.routes.draw do
  root 'splash#index'
  devise_for :users 
  resources :categories
  resources :groups
end
