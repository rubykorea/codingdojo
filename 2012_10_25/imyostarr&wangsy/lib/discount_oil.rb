class DiscountOil
	def initialize(default_price, period, price_per_gallon)
		@condition = {}
		@default_price = default_price
		period.each_with_index do |n, i|
			@condition[n] = price_per_gallon[i]
		end
	end

	def price_for_amount(amount)
		# result = amount * @default_price
		amount2 = amount
		price = 0
		previous_n = 0
		@condition.keys.sort.each do |n|
			if n >= amount
				price += amount2 * @condition[n]
				amount2 = 0
			else
				price += (n - previous_n) * @condition[n]
				amount2 = amount2 - (n - previous_n)
				previous_n = n
			end
		end
		price += amount2 * @default_price
	end

	def price_for_amount(amount)
		price = amount * @default_price
		privious_price = 0
		@condition.keys.sort.reverse.each_with_index do |n, i|
			privious_price = @condition[n] - @default_price - privious_price
			price += [amount, n].min * privious_price
		end
		price
	end

	def generilized_price_for_amount(amount)

	end

	def second_method(amount)
		result = amount * 75
		if amount > 40
			result += (20 * 15) + (20 * 5)
		elsif amount > 20
			result += (20 * 15)
		else
			result += amount * 15
		end
		return result
	end

	def first_method(amount)
		if amount > 40
			return (20 * 9) + (20 * 8) + (75 * (amount - 40))
		elsif amount > 20
			return (20 * 9) + (8 * (amount - 20))
		else
			return amount * 9
		end
	end

end