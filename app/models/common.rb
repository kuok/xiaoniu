class Common
  def self.percentage num, bit = 0
    return 0 unless num.is_a?(Fixnum) or num.is_a?(Float)
    (num.to_f * 100).round(bit).to_s + "%"
  end

  def self.calculate_rate up, down
    return 0 if down.to_i == 0
    percentage(up.to_f / down.to_f)
  end

  def self.int_percents up, down
    return 0 if down.to_i == 0
    int_percentage(up.to_f / down.to_f)
  end

  def self.int_percentage num
    return 0 unless num.is_a?(Fixnum) or num.is_a?(Float)
    (num.to_f * 100).round(0).to_i
  end
end