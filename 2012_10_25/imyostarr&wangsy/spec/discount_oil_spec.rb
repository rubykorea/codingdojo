require "spec_helper"
require "discount_oil"

describe DiscountOil do
  let(:discount_oil) { DiscountOil.new(75, [20, 40], [90, 80]) }

	describe "#quick_methods" do

		# it "test" do
		# 	discount_oil.first_method(35).should == 3000
		# 	discount_oil.first_method(100).should == 7900
		# 	discount_oil.second_method(35).should == 3000
		# 	discount_oil.second_method(100).should == 7900
		# end

		it "#price_for_amount" do
			discount_oil.price_for_amount(100).should == 7900
			discount_oil.price_for_amount(35).should == 3000
		end

	end

end