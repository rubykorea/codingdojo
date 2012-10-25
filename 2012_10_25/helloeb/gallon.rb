require 'test/unit'

def calculate_price(gallon)
  (1..gallon).map do |num|
    if num <= 20
      90
    elsif num <= (20 + 40)
      80
    else
      75
    end
  end.inject{|a, b| a += b}
end

class TestGallon < Test::Unit::TestCase
  def test_calculate_price
    assert_equal(1350, calculate_price(15))
    assert_equal(3000, calculate_price(35))
    assert_equal(6125, calculate_price(75))
    assert_equal(8000, calculate_price(100))
    assert_equal(7250, calculate_price(90))
  end
end
