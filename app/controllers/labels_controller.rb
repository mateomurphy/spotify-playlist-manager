require 'paginated_search'

class LabelsController < ApplicationController
  def show
    @label_name = params[:id]
    @results = Release.find_by_label(@label_name)
  end
end
