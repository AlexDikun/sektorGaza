# config/routes.rb
# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :products, only: %i[show create update destroy]
      resources :categories, only: %i[create update destroy]
      resources :categorizations, only: %i[create destroy]

      resources :catalog, only: :index
      get 'catalog_filter', to: 'catalog#filter'

      resources :users, only: %i[show update destroy] do
        resources :orders, only: %i[show create]
      end
    end
  end

  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/v1/login',
               sign_out: 'api/v1/logout',
               registration: 'api/v1/signup'
             },
             controllers: {
               sessions: 'api/v1/sessions',
               registrations: 'api/v1/registrations'
             }
end
