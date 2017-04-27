require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedOut.new do
    root to: 'sessions#new'
  end

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get 'auth/doorkeeper/callback', to: 'users/omniauth_callbacks#doorkeeper'
end
