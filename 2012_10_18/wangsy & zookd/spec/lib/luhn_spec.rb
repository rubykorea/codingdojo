require './lib/luhn.rb'

describe "Array" do
  it "should return even array" do
    [1, 2, 3, 4, 5].even == [2, 4]
  end
end

describe " Luhn Algorithm " do
  it "should luhn to true " do
    "79927398713".luhn3 == true
  end

  it "should luhn to true " do
    "79927398710".luhn3 == true
  end
    it "should luhn to true " do
    "79927398713".luhn2 == true
  end

  it "should luhn to true " do
    "79927398710".luhn2 == true
  end

  it "should luhn to true " do
    "79927398713".luhn == true
  end

  it "should luhn to true " do
    "79927398710".luhn == false
  end

  it "should luhn to true " do
    "79927398711".luhn == false
  end

  it "should luhn to true " do
    "79927398712".luhn == false
  end

  it "should luhn to true " do
    "79927398714".luhn == false
  end

  it "should luhn to true " do
    "79927398715".luhn == false
  end

  it "should luhn to true " do
    "79927398716".luhn == false
  end

  it "should luhn to true " do
    "79927398717".luhn == false
  end

  it "should luhn to true " do
    "79927398718".luhn == false
  end

  it "should luhn to true " do
    "79927398719".luhn == false
  end
end
