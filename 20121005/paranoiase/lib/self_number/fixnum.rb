require './lib/ruby_extensions/array'
require './lib/ruby_extensions/fixnum'
require './lib/self_number/fixnum/cache'

class Fixnum
  def d
    self.to_digits.sum + self
  end

  def self_number?
    (1..self).all? {|i| i.d != self}
  end unless method_defined? :self_number?
end