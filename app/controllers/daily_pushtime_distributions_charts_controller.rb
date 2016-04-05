class DailyPushtimeDistributionsChartsController < ApplicationController
  def index
    Chart::Common.pre_deal_date(params)
    @chart = Chart::DailyPushtimeDistributions.chart(params)
  end
end
