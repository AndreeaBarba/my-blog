Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end

  root "posts#index"

  get '/about', to: 'pages#about'

  resources :users



  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end
