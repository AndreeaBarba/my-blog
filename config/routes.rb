Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end

  root "posts#index"

  get '/about', to: 'pages#about'

  get 'register', to: 'users#new', as: 'new_user'
  post 'users', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'



  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
