def sum(array)
	array.inject(:+)
end

def d(n)
	n + sum(n.to_s.split("").map(&:to_i))
end

generators = [*1...5000]
generated_numbers = generators.map { |n| d(n) }
self_numbers = generators - generated_numbers
puts sum(self_numbers)