# Self Number

# 어떤 자연수 n이 있을 때, d(n)을 n의 각 자릿수 숫자들과 n 자신을 더한 숫자라고 정의하자.

# 예를 들어 d(91) = 9 + 1 + 91 = 101

# 이 때, n을 d(n)의 제네레이터(generator)라고 한다. 위의 예에서 91은 101의 제네레이터이다.
# 어떤 숫자들은 하나 이상의 제네레이터를 가지고 있는데, 101의 제네레이터는 91뿐 아니라 100도 있다.

# 그런데 반대로, 제네레이터가 없는 숫자들도 있으며, 이런 숫자를 인도의 수학자 Kaprekar가
# 셀프 넘버(self-number)라 이름 붙였다. 예를 들어 1,3,5,7,9,20,31은 셀프 넘버들이다.

class SelfNumbers

  def initialize(max)
    @max = max
    calculate_generator_table
  end

  def all
    @all ||= (1..@max).to_a - @generator_table.keys
  end

  def sum
    all.inject {|r,n| r+=n}
  end

  def generator_table
    @generator_table ||= calculate_generator_table
  end

  private
  def calculate_generator_table
    @generator_table = {}

    (1..@max).each do |num|
      # 91 : 9 + 1 + 91 = 101
      # The generator of 101 includes 91.
      result = num.to_s.split("").map(&:to_i).inject {|r,n| r += n} + num
      @generator_table[result] ||= []
      @generator_table[result].push num
    end

    @generator_table
  end

end
