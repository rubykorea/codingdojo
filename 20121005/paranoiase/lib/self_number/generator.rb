require './lib/self_number/fixnum'

module SelfNumber
  class Generator
    class << self
      def generate_cache_table(min, max)
        {}.tap do |table|
          (min..max).each do |value|
            table[value] ||= nil

            result = value.d

            table[result] ||= []
            table[result] << value
          end
        end
      end
    end

    def initialize(min, max)
      @cache_table = self.class.generate_cache_table(min, max)
    end

    def self_number?(number)
      not @cache_table[number]
    end
  end
end