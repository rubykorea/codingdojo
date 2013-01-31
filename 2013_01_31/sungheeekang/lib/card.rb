class Card
  include Comparable

  def initialize(card)
    @value = card[0]
  end

  def value
    if ["T", "J", "Q", "K", "A"].include?(@value)
      @value.to_sym
    else
      @value.to_i
    end
  end


  POINT = {
    "2" => 1,
    "3" => 2,
    "4" => 3,
    "5" => 4,
    "6" => 5,
    "7" => 6,
    "8" => 7,
    "9" => 8,
    "T" => 9,
    "J" => 10,
    "Q" => 11,
    "K" => 12,
    "A" => 13,
  }
  def point
    POINT[@value]
  end

  def <=>(other)
    self.point <=> other.point
  end
end