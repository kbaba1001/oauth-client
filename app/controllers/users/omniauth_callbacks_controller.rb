class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def doorkeeper
    @user = User.find_or_create_with_doorkeeper(request.env['omniauth.auth'])
    binding.pry

    self.current_user = @user
    redirect_to '/'
  end
end
