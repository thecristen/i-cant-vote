Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :stories

  root 'welcome#index'

  get 'cities/:state', to: 'application#cities'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
