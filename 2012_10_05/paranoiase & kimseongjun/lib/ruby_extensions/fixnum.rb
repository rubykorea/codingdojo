require './lib/self_number'

class Fixnum
  def to_digits
    self.to_s.scan(/\d/).map{|value| value.to_i}
  end

  def self_number?
    (1..self).each do |value|
      result = d(value)
      if result == self
        return false 
      end
    end
    true
  end
end