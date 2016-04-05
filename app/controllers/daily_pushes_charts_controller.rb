class DailyPushesChartsController < ApplicationController
  def index
    Chart::Common.pre_deal_date(params)
    params[:tickInterval] = params[:tickInterval] || 3
    @chart = Chart::DailyPushes.chart(params)
  end
end
