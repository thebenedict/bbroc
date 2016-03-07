Rails.application.routes.draw do
  root to: "extra_pages#home"
  
  # override registrations controller for extra field (name)
  devise_for :users, :controllers => { 
    registrations: "registrations",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  get '/posts', to: 'posts#index', as: :user_root
  resources :posts
end