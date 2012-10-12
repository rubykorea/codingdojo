require './lib/self_number/generator'

class Fixnum
  def self.cache_table
    @cache_table ||= SelfNumber::Generator.new(1, 5000)
  end

  def cache_table
    self.class.cache_table
  end

  def self_number?
    cache_table.self_number? self
  end
end