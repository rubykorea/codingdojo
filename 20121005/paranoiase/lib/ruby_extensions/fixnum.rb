class Fixnum
  def to_digits
    self.to_s.split('').map(&:to_i)
  end
end