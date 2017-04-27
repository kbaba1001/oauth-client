require_dependency Rails.root.join('lib/omniauth/strategies/doorkeeper.rb')

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :doorkeeper, ENV['OAUTH_ID'], ENV['OAUTH_SECRET']
end
