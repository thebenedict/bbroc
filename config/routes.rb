Rails.application.routes.draw do
  get 'vendorscontroller/new'

  get 'requests/create'

  namespace :admin do
    resources :users
    resources :posts
    resources :vendors
    resources :requests
    resources :matches
    
    root to: "users#index"
  end

  get '/messenger', to: 'messenger_webhook#webhook'

  root to: "extra_pages#home"

  # override registrations controller for extra field (name)
  devise_for :users, :controllers => { 
    registrations: "registrations",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  get '/posts', to: 'posts#index', as: :user_root
  get '/notify', to: 'requests#send_fulfillment_notifications'
  resources :posts
  resources :requests, only: :create
  resources :vendors, only: [:index, :new, :create]
  get '/vendors/:vendor_slug', to: 'extra_pages#home'
end