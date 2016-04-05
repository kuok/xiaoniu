class Chart::DailyPushtimeDistributions
  def self.chart params
    begin_date = params[:begin_date]
    end_date   = params[:end_date]
    pushes = Push.where("p_date >= ? and p_date <= ?", begin_date, end_date)
    ydatas = ydatas(params[:name], pushes)

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "IOS端各app推送时间分布表" )
      f.xAxis(categories: hour_points, tickInterval: 2)
      ydatas.keys.each do |key|
        f.series(name: key, data: ydatas[key])
      end

      f.yAxis [
        {title: {text: "该时间段推送条数", margin: 70} },
        {title: {text: ""}, opposite: false},
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 40, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "area"})
    end
    @chart
  end

  private
  def self.ydatas name, pushes
    ydatas = {}
    competitor_names = Chart::Common.competitor_names(name)
    competitor_names.each do |name|
      competitor_id = Competitor.find_by_name(name).try(:id)
      current_pushes = pushes.select{|push| push.competitor_id == competitor_id }
      p_dates = current_pushes.collect{|push| push.p_date}
      ydatas[name] = datetimes_to_hour(p_dates)
    end
    ydatas
  end

  def self.datetimes_to_hour datetimes
    result = {}
    hours = []
    datetimes.each do |datetime|
      hour = datetime.hour
      min  = datetime.min
      hour += min > 30 ? 1 : 0
      hours << hour
    end
    hours.sort!.delete_if {|hour| hour < 7 }
    hours.each do |hour|
      result[hour] = result[hour].to_i + 1
    end
    result.values
  end

  def self.hour_points
    (7..24).to_a
  end
end