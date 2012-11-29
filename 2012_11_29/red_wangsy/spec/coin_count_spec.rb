require "spec_helper"
require "./lib/coin_count"

describe CoinCount do
	describe "#" do
		CoinCount.count(1750).should == 53
	end
end