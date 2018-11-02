Rails.application.routes.draw do

  root to: "profile#dashboard"

  resources :accounts, only: [:index] do
    resources :account_transactions, only: [:new, :create,:withdraw, :deposit]
  end

  namespace :api do
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :accounts
      end
    end
  end
end

  # devise_for :users
  #
  # resources :accounts
  # #resources :users
  # resources :account_transactions
