require './lib/self_number/generator'

generator = SelfNumber::Generator.new(1, 5000)
puts generator.sum