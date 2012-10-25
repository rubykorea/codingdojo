class Luhn
  def initialize(number)
    number = number.to_s.scan(/[\d]/)
    @check_number = number.pop.to_i
    @number = number.map(&:to_i)
  end

  def valid?
    @check_number == check_digit
  end

  def double_every_other
    @number.reverse.each_with_index.map { |n, i| i.even? ? n * 2 : n }.reverse
  end

  def cumulated_number
    double_every_other.join.split("").map(&:to_i).inject(&:+)
    # double_every_other.inject(0) {|r,n| r += (n > 9 ? n-9: n)}
  end

  def check_digit
    (10 - cumulated_number % 10) % 10
  end
end