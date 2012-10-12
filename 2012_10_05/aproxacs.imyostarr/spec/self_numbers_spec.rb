require "spec_helper"

require "self_numbers"

describe SelfNumbers do
  let(:max) { 5000 }
  let(:self_numbers) { SelfNumbers.new(max) }

  describe "#all" do
    
    it "should return self numbers in array" do
      numbers = self_numbers.all

      numbers.should be_instance_of(Array)
      [1,3,5,7,9,20,31].each do |num|
        numbers.should include(num)
      end
    end

  end

  
  describe "#generator_table" do
    it "generators of 101 are 91 and 100" do
      self_numbers.generator_table[101].should include(91)
      self_numbers.generator_table[101].should include(100)
    end
  end


  describe "#sum" do
    it "sum of self_numbers to 5000 is 1227365" do
      self_numbers.sum.should == 1227365
    end
  end

end