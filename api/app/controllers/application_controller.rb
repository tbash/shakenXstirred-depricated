class ApplicationController < ActionController::API

  def current_user
    auth_token = request.headers[:HTTP_AUTH_TOKEN]
    current_user = User.where(authentication_token: auth_token)
    if current_user && auth_token
      return current_user.first
    else
      return nil
    end
  end
end
