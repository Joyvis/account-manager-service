Rails.application.routes.draw do
  resources :transfers, only: [:create]
  resources :accounts, only: [:show]
end
