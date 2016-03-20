class Chart
  def self.column_chart
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Q1移动端各类型Push内容变化" )
      f.xAxis(categories: PushType::TYPES)
      Competitor.all.each do |com|
        f.series(name: com.name, data: Push.pushes_percent[com.id])
      end

      f.yAxis [
        {title: {text: "百分比", margin: 70} },
        {title: {text: ""}, opposite: true},
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "column"})
    end
    @chart
  end

  def self.line_chart
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "每日Push条数")
      f.xAxis(categories: PushType::TYPES)
      Competitor.all.each do |com|
        f.series(name: com.name, data: Push.pushes_percent[com.id])
      end

      f.yAxis [
        {title: {text: "百分比", margin: 70} },
        {title: {text: ""}, opposite: true},
      ]

      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "column"})
    end
    @chart
  end
end