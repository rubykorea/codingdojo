require 'spec_helper'
require 'oil'

describe Oil do
  describe '#price' do
    it "should calculate price of oil" do
      Oil.new(0).price.should == 0
      Oil.new(20).price.should == 1800

      Oil.new(21).price.should == 1880
      Oil.new(40).price.should == 3400

      Oil.new(41).price.should == 3475
    end
  end
  describe '#discountable_amount' do
    it "should calculate" do
      Oil.new(0).discountable_amount(0, 20).should == 0
      Oil.new(20).discountable_amount(0, 20).should == 20

      Oil.new(21).discountable_amount(20, 40).should == 1
      Oil.new(40).discountable_amount(20, 40).should == 20
      Oil.new(41).discountable_amount(20, 40).should == 20

      Oil.new(41).discountable_amount(40, Float::INFINITY).should == 1
    end
  end
end



