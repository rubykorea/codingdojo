require './lib/ruby_extensions/fixnum'

describe Fixnum do
  describe "#to_digits" do
    100.to_digits.should == [1, 0, 0]
  end

  describe "#self_number?" do
    it "should validate self number" do
      1.should be_self_number
      2.should_not be_self_number
      3.should be_self_number
    end
  end
end