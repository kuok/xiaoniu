module DataStaticHelper

  def charts
    # charts = Dir.entries("app/controllers").delete_if {|fn| fn !~ /charts_controller\.rb$/}
    # charts.each {|chart| chart.sub!(/_charts_controller.rb/, "")}
    # charts
    [
      :daily_pushes, :daily_pushtime_distributions, :push_types, 
      :push_deeps, :push_copies
    ]
  end

  def paths_of_charts
    result = {}
    charts.each do |chart|
      result[chart] = "/" + chart.to_s + "_charts/index"
    end
    result
  end

  def names_of_charts
    {
      :daily_pushes                    =>  "日推送条数",
      :daily_pushtime_distributions    =>  "日推送时间分布",
      :push_types                      =>  "推送内容类型",
      :push_deeps                      =>  "推送内容深度",
      :push_copies                     =>  "推送文案"
    }
  end

end
