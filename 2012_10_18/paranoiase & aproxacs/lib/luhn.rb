class Luhn
  def initialize(number)
    number = number.to_s.gsub("-", "")
    @number = number[0..-2]
    @check_number = number[-1].to_i
  end

  def valid?
    @check_number == check_digit
  end

  def double_every_other
    result = []
    @number.split("").map(&:to_i).reverse.each_with_index do |n, i| 
      result << (i.even? ? n * 2 : n)
    end
    result.reverse.join
  end

  def cumulated_number
    double_every_other.split("").map(&:to_i).inject(&:+)
  end

  def check_digit
    (10 - cumulated_number % 10) % 10
  end
end