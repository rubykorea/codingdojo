require './lib/hand'

describe Hand do
  describe "#highest_card" do
    it "should return the highest card of this hand" do
      hand = Hand.new("2H 3D 5S 9C KD")
      hand.highest_card.should == Card.new("KD")

      hand = Hand.new("2C 3H 4S 8C AH")
      hand.highest_card.should == Card.new("AH")
    end
  end

  describe "#collected" do
    it "should return collected information of hand" do
      hand = Hand.new("2H 2D 5S 9C KD")
      hand.collected.should == {
        "2" => [Card.new("2H"), Card.new("2D")],
        "5" => [Card.new("5S")],
        "9" => [Card.new("9C")],
        "K" => [Card.new("KD")],
      }
    end
  end

  describe "#pair?" do
    it "should return true if hand is pair" do
      hand = Hand.new("2H 2D 5S 9C KD")
      hand.should be_pair

      hand = Hand.new("2H 3D 5S 9C KD")
      hand.should_not be_pair
    end
  end

  describe "#two_pair?" do
    it "should return true if hand is pair" do
      hand = Hand.new("2H 2D 5S 3C 3D")
      hand.should be_two_pair
    end
  end

  describe "#three_of_a_kind?" do
    it "should return true if hand is pair" do
      hand = Hand.new("2H 2D 2S 9C KD")
      hand.should be_three_of_a_kind
    end
  end

  describe "#four_of_a_kind?" do
    it "should return true if hand is pair" do
      hand = Hand.new("2H 2D 2S 2C KD")
      hand.should be_four_of_a_kind
    end
  end


  describe "rank_point" do
    it "should check rank point of this hand" do
      hand = Hand.new("2H 3D 5S 9C KD")
      hand.rank_point.should == 0

      hand = Hand.new("2H 2D 5S 9C KD")
      hand.rank_point.should == 1
    end
  end

  it "should compare two hands" do
    left = Hand.new("2H 3D 5S 9C KD")
    right = Hand.new("2C 3H 4S 8C AH")

    right.should > left

    left = Hand.new("2H 2D 5S 9C KD")
    right = Hand.new("2C 3H 4S 8C AH")

    left.should > right

    left = Hand.new("2H 2D 5S 3C 3D")
    right = Hand.new("2C 2H 4S 8C AH")

    left.should > right

    left = Hand.new("2H 2D 2S 9C KD")
    right = Hand.new("3C 3H 4S 4C AH")

    left.should > right

    left = Hand.new("2H 2D 2S 2C KD")
    right = Hand.new("3C 3H 3S 8C AH")

    left.should > right
  end
end