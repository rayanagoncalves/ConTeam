Rails.application.routes.draw do
  root to: 'containers#login'
  get 'containers', to: "containers#index"
  get 'containers/login/show', to: "containers#show"
  get 'containers/cadastro', to: "containers#cadastro"
  get 'containers/login', to: "containers#login"
  get 'containers/new', to: "containers#new"
  post 'containers', to: "containers#create"
  get 'containers/:id', to: "containers#show"
  put 'containers/:id', to: "containers#update"
  get 'containers/:id/edit', to: "containers#edit"
  post 'get_token', to: "autenticacao#get_token"
  delete 'containers/:id', to: "containers#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
