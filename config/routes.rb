Rails.application.routes.draw do
  root "sessions#new"
  resources :tasks
  resources :users , only: [:new,:create,:show,:edit,:destroy,:update]
  resources :sessions , only: [:new,:create,:destroy]
end
