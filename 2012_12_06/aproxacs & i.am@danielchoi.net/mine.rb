class Mines
	attr_reader :mines
	def initialize(n,m)
		@n = n
		@m = m
		@mines = Array.new(n) { Array.new(m) {([0]*7+[1]).sample } }
	end

	def display_mines
		puts "-"*80
		puts "Mines"
		puts "-"*80
		puts @mines.map {|r| r.map {|d| d==0 ? "." : "*"}.join(" ")}.join("\n")
		puts "-"*80
		puts "Hints"
		puts "-"*80
		puts @result.map {|r| r.map {|d| d==-1 ? "*" : d.to_s }.join(" ")}.join("\n")
		puts "-"*80
	end

	def calculate
		@result = Array.new(@n) { Array.new(@m) {0} }
		@pad_mines = @mines.map {|a| na = a.clone; na.unshift(0); na.push(0) }
		@pad_mines.unshift(Array.new(@n+2, 0))
		@pad_mines.push(Array.new(@n+2, 0))

		# puts @pad_mines.map {|r| r.map {|d| d==-1 ? "*" : d.to_s }.join(" ")}.join("\n")
		@n.times do |i|
			@m.times do |j|
				if @mines[i][j] == 1 
					@result[i][j] = -1
				else
					@result[i][j] = 0

					@result[i][j] += @pad_mines[i][j] + @pad_mines[i][j+1] + @pad_mines[i][j+2]
					@result[i][j] += @pad_mines[i+1][j] + @pad_mines[i+1][j+2]
					@result[i][j] += @pad_mines[i+2][j] + @pad_mines[i+2][j+1] + @pad_mines[i+2][j+2]					
				end
			end
		end
	end

end

mines = Mines.new(30,30)
mines.calculate
mines.display_mines