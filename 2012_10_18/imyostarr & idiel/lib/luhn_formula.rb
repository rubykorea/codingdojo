
class LuhnFormula
	def initialize(card_number, validate_number = 0)
		@card_number = card_number
		@validate_number = validate_number
	end

	def isCorrect(num)
		return num == validateNumber()
	end

	def summaryAsLuhn
		counter = 0
		result = 0
		@card_number.to_s.split("").reverse.map(&:to_i).each do |n|
			counter += 1
			if counter.even?
				n = n * 2
		  end
		  result += divide_and_sum(n)
		  # puts n.to_s + ', counter : ' + counter.to_s
		end
		# puts ' = ' + result.to_s
		return result
	end

	def validateNumber
		sum = summaryAsLuhn()
		return (10 - sum % 10) % 10
		# result = sum % 10
		# return result ? 10 - result : result
	end

	def divide_and_sum(n)
		n.to_s.split("").map(&:to_i).inject {|r, n| r+=n} 
	  # if n > 9
	  # 	return n - 9
	  # else
	  # 	return n
	  # end
	end
end