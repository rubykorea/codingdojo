class Array
  def sum 
    self.inject(0) { |sum,value| sum += value }
  end
end