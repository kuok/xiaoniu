class PushType < ActiveRecord::Base
  OTHER = 7

  def self.type_ids
    PushType.all.collect{ |pt| pt.id }.sort!
  end

  def self.type_names
    PushType.all.sort_by {|pt| pt.id }.collect {|pt| pt.name }
  end

end
