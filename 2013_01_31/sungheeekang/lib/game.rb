require './lib/hand'

class Game
  def initialize(left, right)
    @left = Hand.new(left)
    @right = Hand.new(right)
  end

  def winner
    @left > @right ? :left : :right
  end
end
