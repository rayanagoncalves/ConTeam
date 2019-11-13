Rails.application.routes.draw do
  resources :containers
  get 'containers/:id/stop', to: "containers#stop"
  get 'containers/:id/start', to: "containers#start"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
