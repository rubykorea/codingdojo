class PoterStemming
	def poter_stemming(string)
		if step_1a(string)
		elsif step_1b(string)
		end
	end

	def step_1a(string)
		# step 1a
		if string[-4..-1] == "sses"
			return string[0...-4] + "ss"
		elsif string[-3..-1] == "ies"
			return string[0...-3] + "i"
		elsif string[-2..-1] == "ss"
			return string
		elsif string[-1] == "s"
			return string[0...-1]
		else
			return nil
		end
	end

	def step_1b(string)
		if (string[-3..-1] == "eed")
			if m_counter(string[0...-3]) > 0
				return string[0...-3] + "ee"
			else
				return string
			end
		elsif (string[-2..-1] == "ed")
			if (string[0...-2] =~ /[aeiou]/i)
				return string[0...-2]
			else
				return string
			end
		elsif (string[-3..-1] == "ing")
			if (string[0...-3] =~ /[aeiou]/i)
				return string[0...-3]
			else
				return string
			end
		end
	end

	def step_1b1(string)
		if (string[-2..-1] == "at")
			return string[0...-2] + "ate"
		elsif (string[-2..-1] == "bl")
			return string[0...-2] + "ble"
		elsif (string[-2..-1] == "iz")
			return string[0...-2] + "ize"
		elsif ["bb", "dd", "ff", "gg", "mm", "nn", "pp", "rr", "tt", "ww", "xx"].include?(string[-2..-1])
			return string[0...-1]
		else # 122
			if (m_counter == 1) && ["x", "y", "w"].include?(string[-1])
				return string + "e"
			else
				return string
			end
		end
	end

	def m_counter(string)
		string.scan(/([aeiou][^aeiou])/).length
	end


	# def m_lager_then_zero(string)
	# 	unless string =~ /[aeiou][^aeiou]/i
	# 		return false
	# 	end
	# 	return true
	# end
end