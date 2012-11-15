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
    @primes = [2,3,5,7]
  end

  def sum_table
    @sum_table ||= make_pairs
  end

  def result
    sum_table.map {|k,v| (k < v and sum_table[v] == k) ? [k,v] : nil}.compact.uniq
  end

  private
  def make_pairs
    # (2..@number).inject({1 => -1}) do |ret, i|
    #   ret[i] = i.real_submultiples.inject(&:+)
    #   ret
    # end

    result = {}
    rsp = {} # real submultiples pair
    (2..@number).each do |num|
      
      # 10의 약수는 5의 약수 + (5의 약수들 * 2) 한 것과 같다.
      # [1,2,5] = [1] + [2] + [5]
      # 45의 약수는 15의 약수 + (15의 약수들 *3) 한 것과 같다.
      #          ([1,3,5] + [3,9,15] + [15]).uniq
      #
      # 사용하는 @primes의 갯수가 많아지면 성능은 더 떨어진다.
      num_rs = nil
      @primes.each do |prime|
        break if prime >= num
        if num % prime == 0
          prev_num = num/prime
          num_rs = rsp[prev_num].map{|n| n*prime}.push(prev_num).concat(rsp[prev_num]).uniq
          break;
        end
      end

      # @primes 를 이용해서 구하지 못한 경우 숫자로부터 구한다.
      rsp[num] = num_rs || num.real_submultiples
      result[num] = rsp[num].inject(&:+)
    end
    result
  end

end