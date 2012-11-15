require "spec_helper"
require "amicable_pair"

describe AmicablePair do
	let(:amicable_pair){AmicablePair.new}

	describe "sum_submultiple" do
		it "test" do
			amicable_pair.sum_submultiple(6).should == 6
			amicable_pair.sum_submultiple(10).should == 8
		end
	end

	describe "amicable_pair" do
		it "test" do
			amicable_pair.amicable_pair.should include([220,284])
			amicable_pair.amicable_pair.should include([284,220])
			# amicable_pair.amicable_pair.should == [284,220]
		end
	end
end