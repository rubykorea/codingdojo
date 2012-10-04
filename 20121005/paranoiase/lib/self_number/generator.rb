require './lib/ruby_extensions/array'
require './lib/ruby_extensions/fixnum'

module SelfNumber
  class Generator
    class << self
      def d(number)
        number.to_digits.sum + number
      end

      def generate_cache_table(min, max)
        table = {}
        (min..max).each do |value|
          table[value] ||= nil

          result = d(value)

          table[result] ||= []
          table[result] << value
        end
        table
      end
    end

    def initialize(min, max)
      @cache_table = self.class.generate_cache_table(min, max)
    end

    def self_number?(number)
      not @cache_table[number]
    end

    def self_numbers
      @cache_table.select{|key, value| !value}.keys
    end

    def sum
      self_numbers.sum
    end
  end
end