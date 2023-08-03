Rails.application.routes.draw do
  resources :users
  resources :cleaners
  post '/login', to: 'authentication#login'
  post 'cleaner/login', to: 'authentication#cleaner_login'
  get '/*a', to: 'application#not_found'
end