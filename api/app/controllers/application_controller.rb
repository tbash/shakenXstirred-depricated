class ApplicationController < ActionController::API
  # serialization_scope :current_user

  # Returns the active user associated with the access token if available
  def current_user
    current_user = User.where(authentication_token: request.headers[:authorization])
    if current_user
      return current_user.first
    else
      return nil
    end
  end
end
