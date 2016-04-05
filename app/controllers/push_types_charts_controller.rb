class PushTypesChartsController < ApplicationController
  def index
    Chart::Common.pre_deal_date(params)
    @chart_competitor, @chart_month = Chart::PushTypes.chart(params)
  end
end
