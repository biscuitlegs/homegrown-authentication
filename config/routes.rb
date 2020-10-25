Rails.application.routes.draw do
  root to: "users#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
