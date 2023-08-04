Rails.application.routes.draw do

  resources :plans
  resources :users
  resources :cleaners do
    resources :reviews, only: [:show, :edit, :new]
  end
  post '/login', to: 'authentication#login'
  post 'cleaner/login', to: 'authentication#cleaner_login'
  get '/*a', to: 'application#not_found'
end