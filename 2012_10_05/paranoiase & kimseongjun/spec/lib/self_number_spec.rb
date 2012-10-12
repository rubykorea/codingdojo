require './lib/self_number'

describe "self number" do
  describe "#d" do
    it "should return 101 if value is 91" do
      d(91).should == 101
    end
  end
end

describe "#sum_of_self_number" do
  def sum_of_self_number(number)
    array = []
    (1..number).each do |value|
      array << value if value.self_number?
    end
    array.sum
  end

  it "should sum of all self number" do
    sum_of_self_number(1).should == 1
    sum_of_self_number(2).should == 1
    sum_of_self_number(3).should == 4
    sum_of_self_number(10).should == 25
    # sum_of_self_number(5000).should == 1227365 
  end
end