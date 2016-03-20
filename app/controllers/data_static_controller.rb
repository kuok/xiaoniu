class DataStaticController < ApplicationController
  def index
    @chart = Chart.column_chart
  end
end
