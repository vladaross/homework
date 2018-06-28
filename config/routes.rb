Rails.application.routes.draw do

  root to: "profile#dashboard"

  resources :accounts, only: [:index] do
    resources :account_transactions, only: [:new, :create,:withdraw, :deposit]
  end



  devise_for :users

  resources :accounts
  resources :users
  resources :account_transactions

end
