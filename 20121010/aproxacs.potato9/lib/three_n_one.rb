class ThreeNOne
  attr_reader :cycle_length_hash, :working_time
  def initialize(min, max)
    @min = min
    @max = max
    @cycle_length_hash = {}
  end

  # def cycle_length1(num)
  #   counter = 1
  #   until num == 1
  #     counter += 1
  #     if num % 2 == 0
  #       num /= 2
  #     else
  #       num = 3 * num + 1
  #     end
  #   end
  #   counter
  # end

  def cycle_length(num)
    counter = 0
    paths = []

    while true
      if cycle_length_hash[num]
        counter += cycle_length_hash[num]
        break
      else
        if num == 1
          counter +=1
          break
        end
        num = do_3_plus_1(num)
        paths << num
        counter += 1
      end
    end

    paths.each_with_index do |num, index|
      @cycle_length_hash[num] ||= counter - index -1
    end

    counter
  end

  def do_3_plus_1(num)
    if num % 2 == 0
      num /= 2
    else
      num = 3 * num + 1
    end    
  end

  def calculate_hash
    array = (@min..@max).to_a
    start_time = Time.now
    array.each do |num|
      @cycle_length_hash[num] = cycle_length(num)
    end
    end_time = Time.now
    @working_time = end_time - start_time
  end

  def max_length
    @cycle_length_hash.values.max
  end

end
