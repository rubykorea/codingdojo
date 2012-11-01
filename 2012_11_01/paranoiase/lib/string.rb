require './lib/porter_stemming'

class String
  def stem
    PoterStemming.new(self).stem
  end
end