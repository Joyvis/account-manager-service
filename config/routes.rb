Rails.application.routes.draw do
  resources :transfers, only: [:create]
  resources :accounts, only: [:show]

  post 'users/login', to: 'users#authenticate'
end
