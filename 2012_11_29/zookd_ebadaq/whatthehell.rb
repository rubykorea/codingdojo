	
	UNITS = [10000, 5000, 1000, 500, 100, 50]
	
	
	def first_unit(amount)
		UNITS.select {|unit| amount >= unit}.first	
	end


	def next_unit(unit)
		UNITS[UNITS.index(unit) + 1]
	end
	
	
	def left_amount(amount, unit)
		[unit, amount / unit]
	end
	
	
	def loop_limit(amount, present_unit)
		amount / present_unit
	end
	
	
	def calculate(amount)
	
		present_unit = first_unit(amount)
		first_limit  = loop_limit(amount, present_unit)
		count = 0
		# original = amount		
		
		first_limit.downto(0) do |x|
			left = amount % x
			count += 1 if left == 0
			break if amount == 0
			amount -= x * present_unit
			calculate(left)
		end
		
		puts count
		
	end

