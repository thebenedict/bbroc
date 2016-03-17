Rails.application.routes.draw do
  get 'requests/create'

  namespace :admin do
    resources :users
    resources :posts
    resources :vendors
    resources :requests
    resources :matches
    
    root to: "users#index"
  end

  root to: "extra_pages#home"
  
  # override registrations controller for extra field (name)
  devise_for :users, :controllers => { 
    registrations: "registrations",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  get '/posts', to: 'posts#index', as: :user_root
  resources :posts
  resources :requests, only: :create
end