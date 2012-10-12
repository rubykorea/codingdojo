require './lib/ruby_extensions/fixnum'
require './lib/ruby_extensions/array'

def d(number)
  number.to_digits.sum + number
end