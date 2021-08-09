class OmniauthController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    data = {
      'id' => spotify_user.id,
      'credentials' => spotify_user.credentials
    }

    session[:user] = data

    redirect_to root_path
  end
end