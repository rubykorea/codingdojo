
def cal(width, height, mine_rate = 0.125)
  
  start = Time.now

  width = [width, 10000].min
  height = [height, 10000].min
  mine_rate = [mine_rate, 0.9].min

  # create map
    map = Array.new(width) { Array.new(height, 0)}
  
  # locate mine
    mine_number = (width * height * mine_rate).round

    count = 0
    until count > mine_number
      x, y = rand(width), rand(height)
      if map[x][y] != "*"
        map[x][y] = "*"

        left  = (x == 0) ? 0 : (x - 1)
        right = (x == (width - 1)) ? (width - 1) : x + 1
        top   = (y == 0) ? 0 : (y - 1)
        bottom = (y == (height - 1)) ? (height - 1) : y + 1

        left.upto(right) do |x|
          top.upto(bottom) do |y|
            map[x][y] += 1 if map[x][y] != "*"
          end
        end

        count += 1
      end
    end

  # display mine_map
    print "\n"
    map.each do |row|
      row.each do |element|
        element = (element == "*") ? "*" : "."
        print element, "\s"
      end
      print "\n"
    end


  # display mine + hint
    print "\n"
    map.each do |row|
      row.each do |element|
        print element, "\s"
      end
      print "\n"
    end

    print "\n"
    puts "rows = #{width} / column = #{height}"
    return Time.now - start
end