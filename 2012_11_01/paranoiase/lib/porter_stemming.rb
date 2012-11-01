class PoterStemming
  def initialize(text)
    @text = text
  end

  def stem_1a_101
    @text.gsub!(/^(.*)(sses)$/, '\1ss')
  end

  def stem_1a_102
    @text.gsub!(/^(.*)(ies)$/, '\1i')
  end

  def stem_1a_103
    @text.gsub!(/^(.*)(ss)$/, '\1ss')
  end

  def stem_1a_104
    @text.gsub!(/^(.*)(s)$/, '\1')
  end

  def stem_1b_105
    @text.gsub!(/^(.*)(eed)$/, '\1ee') if count_m > 0
  end

  def stem_1b_106
    regex = /^(.*)(ed)$/
    @text.gsub!(regex, '\1') unless v_contained?(regex)
  end

  def stem_1b_107
    regex = /^(.*)(ing)$/
    @text.gsub!(regex, '\1') unless v_contained?(regex)
  end

  def stem
    stem_1a_101 or stem_1a_102 or stem_1a_103 or stem_1a_104
    stem_1b_105 or stem_1b_106 or stem_1b_107
    @text
  end

  def count_m
    @text.scan(/[aieou][^aieou]/).count - 1
  end

  def v_contained?(regex)
    subbed = @text.gsub(regex, '\1')
    last_vowel_removed = subbed.gsub(/^(.*)([aieou])$/, '\1')
    vowel_count = last_vowel_removed.scan(/[aieou]/).count
    vowel_count == 0
  end
end