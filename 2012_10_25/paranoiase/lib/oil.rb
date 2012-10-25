class Oil
  def initialize(amount)
    @amount = amount
  end

  def price
    discountable_amount(0, 20) * 90 + discountable_amount(20, 40) * 80 + discountable_amount(40, Float::INFINITY) * 75
  end

  def discountable_amount(min, max)
    if @amount < min
      0
    elsif @amount < max
      @amount - min
    else
      max - min
    end
  end
end