require 'test/unit'

class Gallon
  attr_reader :gallon_count

  def initialize(gallon, options = nil)
    @gallon = gallon
    @options = options || {20 => 90, 40 => 80, left_over: 75}
    @gallon_count = count_gallon
  end

  def count_gallon
    result = {}
    gallon_keys = @options.keys
    gallon_keys.pop
    gallon_keys.each_with_index do |k, i|
      @gallon -= result[i + 1] = [@gallon, k].min
    end
    result[gallon_keys.count + 1] = @gallon
    result
  end

  def calculate_price
    result = 0
    @options.keys.each_with_index do |k, i|
      result += @gallon_count[i + 1] * @options[k]
    end
    result
  end
end

class TestGallon < Test::Unit::TestCase
  def test_classfied_gallon
    gallon = Gallon.new(10)
    assert_equal(Gallon, gallon.class)
  end

  def test_count_gallon
    gallon = Gallon.new(10)
    assert_equal({1 => 10, 2 => 0, 3 => 0}, gallon.gallon_count)   

    gallon2 = Gallon.new(30)
    assert_equal({1 => 20, 2 => 10, 3 => 0}, gallon2.gallon_count)
  
    gallon3 = Gallon.new(70)
    assert_equal({1 => 20, 2 => 40, 3 => 10}, gallon3.gallon_count)
  end

  def test_calculate_price
    gallon = Gallon.new(15)
    assert_equal(1350, gallon.calculate_price) 

    gallon = Gallon.new(35)
    assert_equal(3000, gallon.calculate_price)

    gallon = Gallon.new(75)
    assert_equal(6125, gallon.calculate_price)

    gallon = Gallon.new(100)
    assert_equal(8000, gallon.calculate_price)

    gallon = Gallon.new(90)
    assert_equal(7250, gallon.calculate_price) 
  end
end
