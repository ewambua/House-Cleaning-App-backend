Rails.application.routes.draw do
  resources :plans
  resources :users
  resources :cleaners
  post '/login', to: 'authentication#login'
  post 'cleaner/login', to: 'authentication#cleaner_login'
  get '/*a', to: 'application#not_found'

  get '/cleaners', to: 'cleaners#index'
  resources :users, only: [:index, :create, :show, :update]
  resources :cleaners do
    resources :reviews, only: [:show, :create, :destroy, :update]
  end
  


end