
class Cache
  @cached = Array.new
  class << self
    def set(key, value)
      @cached[key] = value
    end

    def has?(key)
      @cached[key] != nil
    end

    def get(key)
      @cached[key]
    end
  end
end

class Fixnum
  def three_n_plus_1
    if self.odd?
      self * 3 + 1
    else
      self / 2
    end
  end

  def cycle
    value, list = self, [self]
    loop do
      return list if value == 1
      value = value.three_n_plus_1
      list << value
    end
  end

  def cycle_length
    value = self
    counter = 1
    loop do
      if value == 1
        Cache.set(self, counter)
        return counter 
      end
      if Cache.has?(value)
        return counter + Cache.get(value) - 1
      end
      counter += 1
      value = value.three_n_plus_1
    end
  end
end

def cycle_length(num)
  value = num
  counter = 1
  loop do
    if value == 1
      Cache.set(num, counter)
      return counter 
    end

    if Cache.has?(value)
      return counter + Cache.get(value) - 1
    end

    if value.odd?
      value = (value * 3 + 1) / 2
      counter += 2
      # value = value * 3 + 1
      # counter += 1
    else
      value = value / 2
      counter += 1
    end
  end
end

class Range
  def maximun_cycle_length
    to_a.reverse.map do |i|
      # puts i.cycle.reverse.join(',')
      cycle_length(i)
    end.max
  end
end