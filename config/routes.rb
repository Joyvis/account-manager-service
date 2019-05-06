Rails.application.routes.draw do
  resources :transfers, only: [:create]
end
