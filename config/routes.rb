# config/routes.rb
# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[create update destroy]
      resources :categories, only: %i[create update destroy]
      resources :categorizations, only: :destroy
    end
  end
end
