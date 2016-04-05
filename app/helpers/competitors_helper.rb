module CompetitorsHelper
  def competitor_names
    Competitor.all.collect{ |com| com.name }.unshift("全部")
  end
end
