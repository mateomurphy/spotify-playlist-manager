require 'paginated_search'

class LabelsController < ApplicationController
  def show
    @label_name = params[:id]
    @results = PaginatedSearch.new("label:\"#{@label_name}\"").sort { |a, b| b.release_date <=> a.release_date }
  end
end
