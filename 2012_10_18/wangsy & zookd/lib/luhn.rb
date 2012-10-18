class Array
  def even
    self.select { |item| self.index(item) % 2 == 1 }
  end

  def odd
    self.select { |item| self.index(item) % 2 == 0 }
  end
end

class String
  def to_integer_array
    self.split('').map {|i| i.to_i }
  end
  def luhn
    arr = self.to_integer_array.reverse
    even = arr.even.map {|a| (a*2 >= 10) ? a*2 - 9 : a*2 }
    check = (even+arr.odd).inject{|sum,x| sum + x }
    ( check % 10 ) == 0
  end

  def luhn2 ()
    check = 0
    new_array = self.to_s.reverse.split('')
    new_array.each do |i|
      if i % 2 == 0
        check += i.to_i
      else
        number = i.to_i * 2
        number -= 9 if number >= 10
        check += number        
      end
    end
    
    ( check % 10) == 0
  end

  def luhn3 ()
    check = 0
    turn = true
    new_array = self.to_s.reverse.split('')
    new_array.each do |i|
      if turn
        check += i.to_i
      else
        number = i.to_i * 2
        number -= 9 if number >= 10
        check += number        
      end
      turn = !turn
    end
    
    ( check % 10) == 0
  end

end
