require './lib/self_number/range'

describe Range do
  describe "#self_numbers" do
    it "should find self numbers" do
      (1..10).self_numbers.should == [1, 3, 5, 7, 9]
    end
  end
end