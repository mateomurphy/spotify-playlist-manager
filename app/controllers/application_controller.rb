class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= begin
      RSpotify::User.new(session[:user]) if session[:user]
    end
  end
end
