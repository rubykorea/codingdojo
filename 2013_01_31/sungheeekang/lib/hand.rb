require './lib/card'

class Hand
  include Comparable

  def initialize(hand)
    @cards = hand.split.map {|card| Card.new(card)}
  end

  def highest_card
    @cards.max
  end

  def collected
    {}.tap do |result|
      @cards.each do |card|
        value = card.value.to_s
        result[value] ||= []
        result[value] << card
      end
    end
  end

  def pair?
    collected.find {|_, cards| cards.count == 2}
  end

  def two_pair?
    collected.select {|_, cards| cards.count == 2}.count == 2
  end

  def three_of_a_kind?
    collected.find {|_, cards| cards.count == 3}
  end

  def four_of_a_kind?
    collected.find {|_, cards| cards.count == 4}
  end

  def rank_point
    if four_of_a_kind?
      4
    elsif three_of_a_kind?
      3
    elsif two_pair?
      2
    elsif pair?
      1
    else
      0
    end
  end

  def <=>(other)
    if self.rank_point != other.rank_point
      self.rank_point <=> other.rank_point
    else
      self.highest_card <=> other.highest_card
    end
  end
end