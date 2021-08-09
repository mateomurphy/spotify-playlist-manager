module ApplicationHelper
  def artist_names(object)
    object.artists.map { |a| a.name }.join(', ')
  end
end
