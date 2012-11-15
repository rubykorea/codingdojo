class AmicablePair
  def initialize(number=10)
    @number = number
  end

  def submultiples(number)
    max = Math.sqrt(number).ceil
    (2..max).map {|i| number % i == 0 ? [i, number/i] : nil}.compact.flatten.push(1).sort.uniq
  end

  def submultiples_old(number)
      submultiples = (1...number).inject([]) do |a, i|
      if number % i == 0
        a << i
      end
      a
    end 
    submultiples  
  end

  def all_pairs
    @all_pairs ||= make_pairs
  end

  def make_pairs
    (2..@number).inject({}) do |ret, i|
      ret[i] = submultiples(i).inject(&:+)
      ret
    end
  end

  def result
    # ret = []
    all_pairs.map {|k,v| all_pairs[k] == v ? [k,v].sort : nil}.compact.uniq
    # all_pairs.each do |k,v|
    #   ret << [k,v].sort if all_pairs[k] == v
    # end

    # ret.uniq
  end
end