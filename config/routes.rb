Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end

  root "posts#index"

  get '/about', to: 'pages#about'

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  get '/logout', to: 'sessions#destroy'
  get '/not_authorized', to: 'pages#not_authorized'
end
