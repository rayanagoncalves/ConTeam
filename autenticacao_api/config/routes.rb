Rails.application.routes.draw do
  resources :users
  post '/auth/login', to: 'authentication#login'
  get 'auth/login', to: 'authentication#login'
  get '/auth/login/check', to: 'authentication#check'
  get '/*a', to: 'application#not_found'
end