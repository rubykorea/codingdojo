class String
  def o?
    self.match(/[^aeiou][aeiou][^aeiou]$/).length > 0 and self.match(/[wxy]$/) == 0
  end
end

class Porter
  def initialize(str)
    @str = str
  end

  def convert
    if @str.end_with? 'sses'
      tmp = @str.sub(/sses$/, 'ss')
    elsif @str.end_with? 'ies'
      tmp = @str.sub(/ies$/, 'i')
    elsif @str.end_with? 'ss'
      tmp = @str.sub(/ss$/, 'ss')
    elsif @str.end_with? 's'
      tmp = @str.sub(/s$/, '')
    end

    if @str.end_with? 'eed' and self.m_value > 1      
      tmp = @str.sub /eed$/, 'ee' 
    elsif @str.end_with? 'eed'
      tmp = @str
    elsif @str.end_with? 'ed' and self.v_value > 1
      tmp2 = @str.sub /ed$/, ""
    elsif @str.end_with? 'ed'
      tmp = @str
    elsif @str.end_with? 'ing' and self.v_value > 1
      tmp2 = @str.sub /ing$/, ""
    elsif @str.end_with? 'ing'
      tmp = @str
    end

    if tmp2
      if  tmp2 =~ /(at|bl|iz)$/
        tmp = (tmp2 << "e")
      elsif tmp2 =~ /(bb|dd|ff|gg|mm|nn|pp|rr|tt|ww|xx)$/
        tmp = tmp2.chop
      elsif tmp2.o?
        tmp = (tmp2 << "e" )
      else
        tmp = tmp2
      end
    end
    tmp
  end

  def m_value
    @str.scan(/[aeiou][^aeiou]/).length
  end

  def v_value
    @str.scan(/[aeiou]/).length
  end

end