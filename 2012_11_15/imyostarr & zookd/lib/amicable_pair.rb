class AmicablePair
	def divisor(number)
		sum = 1

		limit = Math.sqrt(number)

		2.upto(limit.to_i) do |x|
			sum += (x + number / x) if number % x == 0
		end
		sum -= limit.to_i if limit == limit.to_i

		return sum
	end

	def amicable_pair(limit)
		start = Time.now
		2.upto(limit) do |number|
			pair = divisor(number)
			print number, " ", pair, "\n" if is_amicable_pair(number, pair)
		end
		print (Time.now - start)
	end

	def is_amicable_pair(number, pair)
		pair > number && divisor(pair) == number
	end
end