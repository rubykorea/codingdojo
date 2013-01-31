require './lib/game'

describe Game do
  it "should compare two hands" do
    game = Game.new("2H 3D 5S 9C KD", "2C 3H 4S 8C AH")
    game.winner.should == :right

    # game = Game.new("2H 4S 4C 2D 4H", "2S 8S AS QS 3S")
    # game.winner.should == :right

    # game = Game.new("2H 3D 5S 9C KD", "2C 3H 4S 8C KH")
    # game.winner.should == :left

    # game = Game.new("2H 3D 5S 9C KD", "2D 3H 5C 9S KH")
    # game.winner.should == :tie
  end

end