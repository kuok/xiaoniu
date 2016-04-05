require 'roo'
class Push < ActiveRecord::Base
  belongs_to :competitor
  has_one :type

  def self.deal_excel excel
    workbook = Roo::Spreadsheet.open(excel)
    workbook.each_with_pagename do |name, sheet|
      next unless Competitor.valid(name)
      datas = sheet.to_a
      first_row = datas.shift
      next if first_row.first != "竞品"
      deal_datas(datas)
    end
  end

  # def self.change_year pushes
  #   pushes.each do |push|
  #     date = push.p_date.to_s.sub!(/2015/, "2016")
  #     push.p_date = date.to_datetime
  #     push.save!
  #   end
  # end

  # def self.sql
  #   sql = <<-SQL
  #     select * 
  #     from pushes 
  #     where p_date >= '2015-01-01 00:00:00' 
  #     and p_date <= '2015-02-01 00:00:00'
  #   SQL
  #   sql
  # end
  
  private
  def self.deal_datas datas
    return if datas.empty?
    competitor_name = datas.first.first
    return unless Competitor.valid(competitor_name)
    datas = pre_deal_datas(datas)
    competitor_id = Competitor.get_id_by_name(competitor_name)
    datas.each do |row|
      push = Push.new
      push.competitor_id = competitor_id
      push.p_date = (row[0].to_s + " " + row[1]).to_datetime
      push.content = row[2]
      push.type_id = PushType.find_by_name(row[3]).try(:id) || PushType::OTHER
      push.save
    end
  end

  def self.pre_deal_datas datas
    last_date = datas.first.second || Time.now.to_date
    datas.each do |row|
      row.shift
      row[0] = last_date if row[0].nil?
      last_date = row.first
    end
    datas
  end
end