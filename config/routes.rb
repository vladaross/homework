Rails.application.routes.draw do

  root to: "profile#dashboard"

  resources :accounts, only: [:index] do
    resources :deposits, only: [:new, :create]
    resources :withdraws, only: [:new, :create]
  end


  devise_for :users

namespace :admin do
  resources :accounts
  resources :users
  resources :account_transactions
  end
end
