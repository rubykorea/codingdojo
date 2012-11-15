class Fixnum
  def real_submultiples
    max = Math.sqrt(self).to_i
    return [1] if max < 2

    # (2..max).map {|i| self % i == 0 ? [i, self/i] : nil}.compact.flatten.push(1).sort.uniq    
    # (2..max).inject([]) { |r,i| self % i == 0 ? r.concat([i, self/i]) : r}.uniq.push(1)

    # (2..max).inject([]) do |ret, i| 
    #   if self % i == 0
    #     j = self/i
    #     if i == j
    #       ret.push(i)
    #     else
    #       ret.concat([i, j])
    #     end
    #   else
    #     ret
    #   end
    # end.unshift(1)

    (2..max).inject([]) {|r,i| self%i == 0 ? (j=self/i; i==j ? r.push(i) : r.concat([i,j])) : r}.unshift(1)
  end
end

class AmicablePair
  def initialize(number=10)
    @number = number
  end

  def sum_table
    @sum_table ||= make_pairs
  end

  def result
    sum_table.map {|k,v| (k != v and sum_table[v] == k) ? [k,v].sort : nil}.compact.uniq
  end

  private
  def make_pairs
    (2..@number).inject({1 => -1}) do |ret, i|
      ret[i] = i.real_submultiples.inject(&:+)
      ret
    end
  end

end