class ThreeNPlusOne
	def initialize(min, max)
		@ranges = min..max
		@@caches = {}
	end

	def max_cycle_number
		@ranges.each do |i|
			cycle_length(i)
		end
		@ranges.max_by{|i| @@caches[i] }
	end

	def cycle_length(n)
		@@caches[n] ||= if n == 1
							1
						elsif @@caches[next_number(n)]
							1 + @@caches[next_number(n)]
						else
							1 + cycle_length(next_number(n)) 
						end
	end

    def next_number(n)
    	if n == 1
    		nil
    	elsif n.even?
    		n / 2
    	else
    		3 * n + 1
    	end
    end

end