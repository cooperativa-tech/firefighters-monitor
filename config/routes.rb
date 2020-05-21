Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  resources :users, only: [:index]

  get "login" => "sessions#new", :as => :login
  post "login" => "sessions#create"
  post "logout" => "sessions#destroy", :as => :logout

  root to: "users#index"
end
