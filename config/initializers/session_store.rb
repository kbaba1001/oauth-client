# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_oauth-client_session' #, domain: :all
Rails.application.config.middleware.use ActionDispatch::Cookies # Required for all session management
Rails.application.config.middleware.use ActionDispatch::Session::CookieStore, Rails.application.config.session_options
