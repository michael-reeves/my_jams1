Rails.application.routes.draw do
  resources :songs
  resources :users, only: [:new, :show, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'welcome#index'

end
