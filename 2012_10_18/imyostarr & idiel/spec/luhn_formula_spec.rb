require "spec_helper"
require "luhn_formula"

describe LuhnFormula do
	# let (:luhn_formula) { LuhnFormula.new(8173, 4) }
	# 1+6 + 1 + 1+4 + 3 = 16, 4

	# describe "#validateNumber" do
	# 	luhn_formula.validateNumber
	# end
	describe "#summaryAsLuhn" do
		it "test" do
			luhn_formula = LuhnFormula.new(8173, 4)
			luhn_formula.summaryAsLuhn.should == 16
		end
	end

	describe "#isCorrect" do
		it "test" do
			luhn_formula = LuhnFormula.new(8173, 4)
			luhn_formula.isCorrect(4).should == true
			luhn_formula.isCorrect(3).should == false
		end
	end

	describe "#validateNumber" do
		it "test randomized number" do
			10.times do
				card_number = Random.new.rand(1000000000000000..9999999999999999)
				luhn_formula = LuhnFormula.new(card_number)
				puts "card_number : " + card_number.to_s + ", validate number : " + luhn_formula.validateNumber.to_s
			end
		end
	end
end