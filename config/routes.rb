Rails.application.routes.draw do
  resources :songs
  resources :users, only: [:new, :show, :create]
end
