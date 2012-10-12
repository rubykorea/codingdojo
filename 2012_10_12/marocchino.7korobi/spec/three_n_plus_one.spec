require "spec_helper"

require "three_n_plus_one"

describe ThreeNPlusOne do
  let(:obj) { ThreeNPlusOne.new(1, 10_000) }
  it "the cycle length of 2 is 2" do
    obj.next_number(2).should == 1  
  end
  it "the cycle length of 2 is 2" do
    obj.next_number(3).should == 10  
  end
  it "the cycle length of 2 is 2" do
    obj.next_number(1).should be_nil 
  end

  it "the cycle length of 1 is 1" do
    obj.cycle_length(1).should == 1  
  end
  it "the cycle length of 2 is 2" do
    obj.cycle_length(2).should == 2  
  end
  it "the cycle length of 22 is 16" do
    obj.cycle_length(22).should == 16
  end
  it "the max length of " do
    ThreeNPlusOne.new(1, 23).max_cycle_number.should == 18
  end

end
