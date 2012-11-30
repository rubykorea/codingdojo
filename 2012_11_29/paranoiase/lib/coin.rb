class Coin
  def initialize(amount)
    @amount = amount
  end

  COINS = [50, 100, 500, 1000, 5000, 10000]
  def build_combinations_loop(progress, container, cache = [])
    COINS.map do |coin|
      combination = progress.dup + [coin]
      combination.sort!

      next if cache.include? combination

      sum = combination.inject(&:+)
      if sum == @amount
        container << combination
      elsif sum < @amount
        cache << combination
        build_combinations_loop(combination, container, cache)
      end
    end.compact
  end

  def build_combinations
    [].tap do |container|
      build_combinations_loop([], container)
    end.uniq
  end

  def count_combinations
    build_combinations.count
  end
end