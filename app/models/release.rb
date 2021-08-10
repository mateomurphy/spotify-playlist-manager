class Release
  def self.find_by_label(name)
    results = PaginatedSearch.new do |offset|
      RSpotify::Album.search("label:\"#{name}\"", offset: offset)
    end

    results.sort { |a, b| b.release_date <=> a.release_date }
  end
end
