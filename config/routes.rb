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

      resources :users, only: %i[show update destroy]

      resources :carts, only: %i[show destroy]
      resources :line_items, only: %i[create destroy]
      post 'line_items/:id/add', to: 'line_items#add_quantity', as: 'line_item_add'
      post 'line_items/:id/reduce', to: 'line_items#reduce_quantity', as: 'line_item_reduce'
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
