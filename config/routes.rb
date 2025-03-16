Rails.application.routes.draw do
  root 'pages#home'
  resources :pet_trackers
  
  get "up" => "rails/health#show", as: :rails_health_check
  get "/home", to: "pages#home"
  get "signup", to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
