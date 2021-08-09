class PlaylistsController < ApplicationController
  before_action :check_authentication

  def index
    @results = current_user.playlists
  end

  def create
    @label_name = params[:id]
    @results = PaginatedSearch.new("label:\"#{@label_name}\"").sort { |a, b| b.release_date <=> a.release_date }

    playlist = current_user.create_playlist!(@label_name)

    @results.each do |release|
      playlist.add_tracks!(release.tracks)
    end

    redirect_to action: :index
  end
end
