require './lib/card'

describe Card do
  it "should compare two cards" do
    left = Card.new("2H")
    right = Card.new("3D")

    left.should < right
  end

  it "should compare two cards" do
    card = Card.new("2H")
    card.point.should == 1

    card = Card.new("KD")
    card.point.should == 12
  end

  it "should return value of card" do
    card = Card.new("2H")
    card.value.should == 2

    card = Card.new("KD")
    card.value.should == :K
  end
end