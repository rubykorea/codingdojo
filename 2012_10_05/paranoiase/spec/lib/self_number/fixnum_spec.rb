require './lib/self_number/fixnum'

describe Fixnum do
  describe "#d" do
    91.d.should == 101
  end

  describe "#self_number?" do
    it "should validate self number" do
      1.should be_self_number
      3.should be_self_number
      2.should_not be_self_number
    end
  end
end