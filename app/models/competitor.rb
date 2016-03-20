class Competitor < ActiveRecord::Base
  has_many :pushes
  validates_uniqueness_of :name

  def self.deal_photo photo
    return if photo.nil?
    name =  photo.original_filename
    directory = "public/images"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(photo.read) }
  end

  def self.names
    Competitor.all.collect{ |com| com.name }
  end

  def self.valid new_name
    return true if names.include? name
    names.each do |name|
      return true if new_name.include? name
    end
    return false
  end

  def self.get_id_by_name new_name 
    return Competitor.find_by_name(name).id if names.include? name
    names.each do |name|
      return Competitor.find_by_name(name).id if new_name.include? name
    end
  end
end
