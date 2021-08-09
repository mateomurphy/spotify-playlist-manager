class ApplicationController < ActionController::Base
  helper_method :current_user

  def check_authentication
    if !current_user
      render plain: "You need to be logged in"
    end
  end

  def current_user
    @current_user ||= begin
      RSpotify::User.new(session[:user]) if session[:user]
    end
  end
end
