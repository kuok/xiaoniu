class Chart::Common

  DEFAULT_BEGIN_DATE = '2015-12-08'
  DEFAULT_END_DATE   = '2016-01-20'

  def self.pre_deal_date params
    params[:begin_date]   = (params[:begin_date] || Chart::Common::DEFAULT_BEGIN_DATE).to_date
    params[:end_date]     = (params[:end_date]   || Chart::Common::DEFAULT_END_DATE).to_date
  end
  

  def self.competitor_names name
    competitor_names = []
    if name == "全部" || name.nil?
      competitor_names = Competitor.all.collect{ |com| com.name }
    else
      competitor_names << name
    end
  end
  
end