Rails.application.routes.draw do
  root to: "reports#index"
  
  # override registrations controller for extra fields (first_name, last_name)
  devise_for :users, :controllers => { 
    registrations: "registrations",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  resources :reports
end