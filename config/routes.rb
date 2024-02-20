# frozen_string_literal: true

# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                api_v1_product_reviews GET    /api/v1/products/:product_id/reviews(.:format)                                           api/v1/reviews#index {:default=>{:format=>:json}}
#                                       POST   /api/v1/products/:product_id/reviews(.:format)                                           api/v1/reviews#create {:default=>{:format=>:json}}
#                 api_v1_product_review GET    /api/v1/products/:product_id/reviews/:id(.:format)                                       api/v1/reviews#show {:default=>{:format=>:json}}
#                                       PATCH  /api/v1/products/:product_id/reviews/:id(.:format)                                       api/v1/reviews#update {:default=>{:format=>:json}}
#                                       PUT    /api/v1/products/:product_id/reviews/:id(.:format)                                       api/v1/reviews#update {:default=>{:format=>:json}}
#                                       DELETE /api/v1/products/:product_id/reviews/:id(.:format)                                       api/v1/reviews#destroy {:default=>{:format=>:json}}
#                       api_v1_products POST   /api/v1/products(.:format)                                                               api/v1/products#create {:default=>{:format=>:json}}
#                        api_v1_product GET    /api/v1/products/:id(.:format)                                                           api/v1/products#show {:default=>{:format=>:json}}
#                                       PATCH  /api/v1/products/:id(.:format)                                                           api/v1/products#update {:default=>{:format=>:json}}
#                                       PUT    /api/v1/products/:id(.:format)                                                           api/v1/products#update {:default=>{:format=>:json}}
#                                       DELETE /api/v1/products/:id(.:format)                                                           api/v1/products#destroy {:default=>{:format=>:json}}
#                     api_v1_categories POST   /api/v1/categories(.:format)                                                             api/v1/categories#create {:default=>{:format=>:json}}
#                       api_v1_category PATCH  /api/v1/categories/:id(.:format)                                                         api/v1/categories#update {:default=>{:format=>:json}}
#                                       PUT    /api/v1/categories/:id(.:format)                                                         api/v1/categories#update {:default=>{:format=>:json}}
#                                       DELETE /api/v1/categories/:id(.:format)                                                         api/v1/categories#destroy {:default=>{:format=>:json}}
#                api_v1_categorizations POST   /api/v1/categorizations(.:format)                                                        api/v1/categorizations#create {:default=>{:format=>:json}}
#                 api_v1_categorization DELETE /api/v1/categorizations/:id(.:format)                                                    api/v1/categorizations#destroy {:default=>{:format=>:json}}
#                  api_v1_catalog_index GET    /api/v1/catalog(.:format)                                                                api/v1/catalog#index {:default=>{:format=>:json}}
#                 api_v1_catalog_filter GET    /api/v1/catalog_filter(.:format)                                                         api/v1/catalog#filter {:default=>{:format=>:json}}
#                   api_v1_catalog_sort GET    /api/v1/catalog_sort(.:format)                                                           api/v1/catalog#sorting_products_by_reviews {:default=>{:format=>:json}}
#                           api_v1_user GET    /api/v1/users/:id(.:format)                                                              api/v1/users#show {:default=>{:format=>:json}}
#                                       PATCH  /api/v1/users/:id(.:format)                                                              api/v1/users#update {:default=>{:format=>:json}}
#                                       PUT    /api/v1/users/:id(.:format)                                                              api/v1/users#update {:default=>{:format=>:json}}
#                                       DELETE /api/v1/users/:id(.:format)                                                              api/v1/users#destroy {:default=>{:format=>:json}}
#                           api_v1_cart GET    /api/v1/carts/:id(.:format)                                                              api/v1/carts#show {:default=>{:format=>:json}}
#                                       DELETE /api/v1/carts/:id(.:format)                                                              api/v1/carts#destroy {:default=>{:format=>:json}}
#                     api_v1_line_items POST   /api/v1/line_items(.:format)                                                             api/v1/line_items#create {:default=>{:format=>:json}}
#                      api_v1_line_item DELETE /api/v1/line_items/:id(.:format)                                                         api/v1/line_items#destroy {:default=>{:format=>:json}}
#                  api_v1_line_item_add POST   /api/v1/line_items/:id/add(.:format)                                                     api/v1/line_items#add_quantity {:default=>{:format=>:json}}
#               api_v1_line_item_reduce POST   /api/v1/line_items/:id/reduce(.:format)                                                  api/v1/line_items#reduce_quantity {:default=>{:format=>:json}}
#                         api_v1_orders POST   /api/v1/orders(.:format)                                                                 api/v1/orders#create {:default=>{:format=>:json}}
#                          api_v1_order GET    /api/v1/orders/:id(.:format)                                                             api/v1/orders#show {:default=>{:format=>:json}}
#                      new_user_session GET    /api/v1/login(.:format)                                                                  api/v1/sessions#new {:format=>:json}
#                          user_session POST   /api/v1/login(.:format)                                                                  api/v1/sessions#create {:format=>:json}
#                  destroy_user_session DELETE /api/v1/logout(.:format)                                                                 api/v1/sessions#destroy {:format=>:json}
#              cancel_user_registration GET    /api/v1/signup/cancel(.:format)                                                          api/v1/registrations#cancel {:format=>:json}
#                 new_user_registration GET    /api/v1/signup/sign_up(.:format)                                                         api/v1/registrations#new {:format=>:json}
#                edit_user_registration GET    /api/v1/signup/edit(.:format)                                                            api/v1/registrations#edit {:format=>:json}
#                     user_registration PATCH  /api/v1/signup(.:format)                                                                 api/v1/registrations#update {:format=>:json}
#                                       PUT    /api/v1/signup(.:format)                                                                 api/v1/registrations#update {:format=>:json}
#                                       DELETE /api/v1/signup(.:format)                                                                 api/v1/registrations#destroy {:format=>:json}
#                                       POST   /api/v1/signup(.:format)                                                                 api/v1/registrations#create {:format=>:json}
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

# config/routes.rb

Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :products, only: %i[show create update destroy] do
        resources :reviews
      end
      resources :categories, only: %i[create update destroy]
      resources :categorizations, only: %i[create destroy]

      resources :catalog, only: :index
      get 'catalog_filter', to: 'catalog#filter'
      get 'catalog_sort', to: 'catalog#sorting_products_by_reviews'

      resources :users, only: %i[show update destroy]

      resources :carts, only: %i[show destroy]
      resources :line_items, only: %i[create destroy]
      post 'line_items/:id/add', to: 'line_items#add_quantity', as: 'line_item_add'
      post 'line_items/:id/reduce', to: 'line_items#reduce_quantity', as: 'line_item_reduce'

      resources :orders, only: %i[show create]
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
