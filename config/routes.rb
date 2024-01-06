# config/routes.rb
# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[create update destroy]
      resources :categories, only: %i[create update destroy]
      resources :categorizations, only: %i[create destroy]

      resources :catalog, only: :index
      get 'catalog_filter', to: 'catalog#filter'
    end
  end
end
