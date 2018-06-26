Rails.application.routes.draw do

  root to: "profile#dashboard"

  

  devise_for :users

  resources :accounts
  resources :users

end
