class Chart::PushTypes
  def self.chart params
    return chart_by_competitors(params), chart_by_months(params)
  end

  private
  def self.chart_by_competitors params
    ydatas = percents_of_competitors(params[:begin_date], params[:end_date])
    chart_of_data(ydatas, "公司")
  end

  def self.chart_by_months params
    ydatas = percents_of_months(params[:begin_date], params[:end_date])
    chart_of_data(ydatas, "月份")
  end

  def self.percents_of_months begin_date, end_date
    result = {}
    sql = <<-SQL
      select DATE_FORMAT(p_date, '%c') month, type_id
      from pushes
      where p_date >= ? and p_date <= ?
    SQL
    pushes = Push.find_by_sql([sql, begin_date, end_date])
    pushes_of_months = pushes.group_by{|push| push.month }
    # pushes_of_months.keys.each do |month|
    months.each do |month|
      next if pushes_of_months[month].nil?
      pushes_types = pushes_of_months[month].group_by {|push| push.type_id }
      percents = []
      PushType.type_ids.each do |type_id|
        percents << ::Common.int_percents(pushes_types[type_id].to_a.size, pushes_of_months[month].to_a.size)
      end
      result[month] = percents
    end
    result
  end

  def self.percents_of_competitors begin_date, end_date
    result = {}
    pushes = Push.where("p_date >= ? and p_date <= ?", begin_date, end_date)
    pushes_of_competitor = pushes.group_by{|push| push.competitor_id }
    pushes_of_competitor.keys.each do |competitor_id|
      pushes_types = pushes_of_competitor[competitor_id].group_by {|push| push.type_id }
      percents = []
      PushType.type_ids.each do |type_id|
        percents << ::Common.int_percents(pushes_types[type_id].to_a.size, pushes_of_competitor[competitor_id].to_a.size)
      end
      result[competitor_id] = percents
    end
    result
  end

  def self.chart_of_data ydatas, hint
    xdatas = PushType.type_names
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(categories: xdatas)
      if hint == "公司"
        f.title(text: "Q1移动端各类型Push内容变化" )
        Competitor.all.each do |com|
          f.series(name: com.name, data: ydatas[com.id])
        end
      elsif hint == "月份"
        months.each do |month|
          f.series(name: month, data: ydatas[month].to_a)
        end
      end

      f.yAxis [
        {title: {text: "百分比(按#{hint})", margin: 70} },
        {title: {text: ""}, opposite: true},
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "column"})
    end
    @chart
  end

  def self.months
    ["12", "1", "2", "3", "4"]
  end

end