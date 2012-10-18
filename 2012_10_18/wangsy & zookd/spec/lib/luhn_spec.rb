require './lib/luhn.rb'

describe "Array" do
  it "should return even array" do
    [1, 2, 3, 4, 5].even.should == [2, 4]
  end

  it "should return odd array" do
    [1, 2, 3, 4, 5].odd.should == [1, 3, 5]
  end

  it "should convert string to array" do
    "1234".to_integer_array.should == [1, 2, 3, 4]
  end
end

describe " Luhn Algorithm " do
  # it "should luhn to true " do
  #   "79927398713".luhn3.should == true
  # end

  # it "should luhn to true " do
  #   "79927398710".luhn3.should == true
  # end
  #   it "should luhn to true " do
  #   "79927398713".luhn2.should == true
  # end

  # it "should luhn to true " do
  #   "79927398710".luhn2.should == true
  # end

  it "should luhn to true " do
    "79927398713".luhn.should == true
  end

  it "should luhn to true " do
    "79927398710".luhn.should == false
  end

  it "should luhn to true " do
    "79927398711".luhn.should == false
  end

  it "should luhn to true " do
    "79927398712".luhn.should == false
  end

  it "should luhn to true " do
    "79927398714".luhn.should == false
  end

  it "should luhn to true " do
    "79927398715".luhn.should == false
  end

  it "should luhn to true " do
    "79927398716".luhn.should == false
  end

  it "should luhn to true " do
    "79927398717".luhn.should == false
  end

  it "should luhn to true " do
    "79927398718".luhn.should == false
  end

  it "should luhn to true " do
    "79927398719".luhn.should == false
  end
end
