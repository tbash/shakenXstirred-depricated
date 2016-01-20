class ApplicationController < ActionController::API
  # include ActionController::RequestForgeryProtection
  # protect_from_forgery with: :null_session
  # serialization_scope :current_user

  # Returns the active user associated with the access token if available
  def current_user
    current_user = User.where(authentication_token: request.headers[:HTTP_AUTH_TOKEN])
    if current_user
      return current_user.first
    else
      return nil
    end
  end
end
