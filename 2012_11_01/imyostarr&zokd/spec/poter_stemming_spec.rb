require "spec_helper"
require "poter_stemming"

describe PoterStemming do
	let(:poter_stemming) { PoterStemming.new }

	describe "#step_1a" do
		it "test" do
			poter_stemming.step_1a("caresses").should == "caress"
			poter_stemming.step_1a("ponies").should == "poni"
			poter_stemming.step_1a("carress").should == "carress"
			poter_stemming.step_1a("cats").should == "cat"
		end
	end

	describe "#step_1b" do
		it "test" do
			poter_stemming.step_1b("feed").should == "feed"
			poter_stemming.step_1b("agreed").should == "agree"
			poter_stemming.step_1b("plastered").should == "plaster"
			poter_stemming.step_1b("bled").should == "bled"
			poter_stemming.step_1b("motoring").should == "motor"
			poter_stemming.step_1b("sing").should == "sing"
		end
	end

	describe "#step_1b1" do
		it "test" do
			poter_stemming.step_1b1("conflat").should == "conflate"
			poter_stemming.step_1b1("troubl").should == "trouble"
			poter_stemming.step_1b1("siz").should == "size"
			poter_stemming.step_1b1("tann").should == "tan"
			poter_stemming.step_1b1("hopp").should == "hop"
			poter_stemming.step_1b1("fail").should == "fail"
			poter_stemming.step_1b1("fil").should == "file"
		end
	end
end