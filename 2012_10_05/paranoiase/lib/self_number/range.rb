require './lib/self_number/fixnum'

class Range
  def self_numbers
    select(&:self_number?)
  end
end