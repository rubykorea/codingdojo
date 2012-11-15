class AmicablePair

	def sum_submultiple(n)
		sum = 0
		(1..n-1).each do |k|
			sum += k if n % k ==0
		end
		sum
	end

	def amicable_pair
		friends = []
		(1..10000).each do |n|
			sum = sum_submultiple(n)
			if n == sum_submultiple(sum) && n != sum
				friends << [n,sum]
			end
		end
		friends
	end

end

# amica_pair = AmicablePair.new
# p amica_pair.amicable_pair