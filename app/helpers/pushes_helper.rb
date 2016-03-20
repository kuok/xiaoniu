module PushesHelper
  def competitor_name push
    return '' if push.nil? or push.competitor_id.nil?
    Competitor.find(push.competitor_id).try(:name)
  end

  def type_name push
    return '' if push.nil? || push.type_id.nil?
    PushType.find(push.type_id).try(:name)
  end
end
