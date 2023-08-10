Rails.application.routes.draw do
  resources :plans
  resources :users
  resources :requests
  resources :cleaners do
    resources :reviews, only: [:index, :create, :destroy, :update]
  end

  # Authentication routes
  post '/login', to: 'authentication#login'
  post 'cleaner/login', to: 'authentication#cleaner_login'

  # Custom 404 route
  get '/*a', to: 'application#not_found'

  # Cleaners index route
  get '/cleaners', to: 'cleaners#index'

  # Users routes
  resources :users, only: [:index, :create, :show, :update]

  # Cleaner reviews routes
  resources :cleaners do
    resources :reviews, only: [:show, :create, :destroy, :update]
  end

  resources :users do
    resources :requests, only: [:index, :create, :show, :update]
  end

  post 'request', to: 'requests#create'
end