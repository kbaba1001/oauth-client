class Users::OmniauthCallbacksController < ApplicationController
  skip_before_action :require_login, raise: false

  def doorkeeper
    @user = User.find_or_create_with_doorkeeper(request.env['omniauth.auth'])

    sign_in(@user)

    redirect_to root_path
  end
end
