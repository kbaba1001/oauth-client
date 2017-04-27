Rails.application.routes.draw do
  # root to: ''
  get '/users/auth/doorkeeper/callback', to: 'users/omniauth_callbacks#doorkeeper'
end
