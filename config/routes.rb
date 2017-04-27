Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
    authenticated :user do
      root :to => 'dashboards#show', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
