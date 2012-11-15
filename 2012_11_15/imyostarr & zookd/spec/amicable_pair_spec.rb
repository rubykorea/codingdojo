require "spec_helper"
require "amicable_pair"

describe AmicablePair do
	let(:amicable_pair) { AmicablePair.new }
	describe "#divisor" do
		it "test" do
			amicable_pair.divisor(50) == 43
			amicable_pair.divisor(220) == 284
			amicable_pair.divisor(284) == 220
		end
	end

	# describe "#find_amicable_pair" do
	# 	it "test" do
	# 		amicable_pair.include
	# 	end
	# end

	describe "#is_amicable_pair" do
		it "test" do
			amicable_pair.is_amicable_pair(220, 284).should == true
			amicable_pair.is_amicable_pair(2620, 2924).should == true
		end
	end
end