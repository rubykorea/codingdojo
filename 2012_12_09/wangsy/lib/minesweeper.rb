class MineSweeper
	def initialize (m, n)
		@row = m
		@boxes = []
		1.upto(m*n) do 
			if rand(8) == 0
				@boxes << '*'
			else
				@boxes << '.'
			end
		end
	end

	def print_box
		count = 0
		@boxes.each do |box|
			print "#{box} "
			count = count + 1
			if (count % @row) == 0 then
				print "\n"
			end
		end
	end

	def calc_hint
		bomb = 0
		@boxes.each_index do |index|
			if @boxes[index] == '*' then
				next
			end
			check_indexes = [
				index - 1,
				index + 1,
				index - (@row+1),
				index - (@row),
				index - (@row-1),
				index + (@row+1),
				index + (@row),
				index + (@row-1)]
			check_indexes.each do |index2|
				if index2 >= 0 and index2 < @boxes.size and @boxes[index2] == '*' then
					bomb += 1
				end
			end
			@boxes[index] = bomb
			bomb = 0
		end
	end
end

mime = MineSweeper.new(30, 50)
mime.print_box
mime.calc_hint
mime.print_box