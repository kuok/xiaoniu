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

  def self.pushes_percent
    datas = pushes_sort_by_competitor
    return if datas.empty?
    result = {}
    sql = <<-SQL
      select type_id, count(*) as push_nums
      from pushes
      where competitor_id = ?
      group by type_id
    SQL
    datas.each do |data|
      type_datas = Push.find_by_sql([sql, data.competitor_id])
      re = []
      type_datas.each do |t_data|
        tmp = Common.int_percents(t_data.push_nums, data.push_nums)
        # result[t_data.type_id] = [] if result[t_data.type_id].nil?
        # result[t_data.type_id] << tmp
        re << tmp
      end
      result[data.competitor_id] = re
    end
    result
  end

  def self.pushes_sort_by_competitor
    sql = <<-SQL
      select competitor_id, count(*) as push_nums
      from pushes
      group by competitor_id
    SQL
    result = Push.find_by_sql([sql])
    # .collect{|b| [b.competitor_id, b.push_nums]}
  end
  
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