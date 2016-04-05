class Chart::DailyPushes

  def self.chart params
    dates  = dates(params)    
    ydatas = ydatas(params[:name], dates)
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "IOS端各app日推送条数表" )
      f.xAxis(categories: dates, tickInterval: params[:tickInterval])
      ydatas.keys.each do |key|
        f.series(name: key, data: ydatas[key])
      end

      f.yAxis [
        {title: {text: "日推送条数", margin: 70} },
        {title: {text: ""}, opposite: false},
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 40, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "line"})
    end
    @chart
  end

  private
  def self.dates params
    begin_date = params[:begin_date]
    end_date   = params[:end_date]
    dates = []
    while begin_date <= end_date
      dates << begin_date
      begin_date = begin_date.tomorrow
    end
    dates
  end

  def self.ydatas name, dates
    ydatas = {}
    competitor_names = Chart::Common.competitor_names(name)
    competitor_names.each do |name|
      ydatas[name] = []
      competitor_id = Competitor.find_by_name(name).try(:id)
      pushes = Push.where(competitor_id:competitor_id)
      dates.each do |date|
        ydatas[name] << pushes.select {|push| push.p_date.to_date == date}.size
      end
    end
    ydatas
  end

end