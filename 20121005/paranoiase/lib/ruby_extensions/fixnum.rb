class Fixnum
  def to_digits
    self.to_s.split('').map{|value| value.to_i}
  end
end