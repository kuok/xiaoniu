class PushType < ActiveRecord::Base
  OTHER = 7
  TYPES = PushType.all.collect{ |pt| pt.name }

  # def self.types_array
  #   PushType.all.collect{ |pt| pt.name }
  # end
end
