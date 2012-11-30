require 'spec_helper'
require './lib/coin'

describe Coin do
  describe "#build_combinations" do
    it "should build all cases of coin combinations" do
      coin = Coin.new(50)
      coin.build_combinations.should == [[50]]

      coin = Coin.new(100)
      coin.build_combinations.should == [[50, 50], [100]]

      coin = Coin.new(150)
      coin.build_combinations.should == [[50, 50, 50], [50, 100]]

      coin = Coin.new(200)
      coin.build_combinations.should == [[50, 50, 50, 50], [50, 50, 100], [100, 100]]
    end
  end

  describe "#count_combinations" do
    it "should count all cases of coin combination" do
      coin = Coin.new(50)
      coin.count_combinations.should == 1

      coin = Coin.new(100)
      coin.count_combinations.should == 2

      coin = Coin.new(150)
      coin.count_combinations.should == 2

      coin = Coin.new(200)
      coin.count_combinations.should == 3

      coin = Coin.new(500)
      coin.count_combinations.should == 7

      coin = Coin.new(1700)
      coin.count_combinations.should == 53

      # coin = Coin.new(100_000)
      # coin.count_combinations.should == 49_330_996
    end
  end
end