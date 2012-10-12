require './lib/3n_1'

describe "3N + 1" do
  describe "#three_n_plus_1" do
    it "should divide by 2 if the value is even" do
      2.three_n_plus_1.should == 1
    end

    it "should calculate 3N + 1 if the value is odd" do
      11.three_n_plus_1.should == 34
    end
  end

  describe "#cycle" do
    it "should get cycle of #three_n_plus_1" do
      1.cycle.should == [1]
      2.cycle.should == [2, 1]
      4.cycle.should == [4, 2, 1]
      22.cycle.should == [22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
    end
  end

  describe "#cycle_length" do
    it "should get the length of cycle" do
      1.cycle_length.should == 1
      22.cycle_length.should == 16
    end
  end

  describe "#maximun_cycle_length" do
    it "should get the maximun of cycle length" do
      (1..2).maximun_cycle_length.should == 2
      (1..22).maximun_cycle_length.should == 21
    end
  end
end

describe Cache do
  describe "#set" do
    Cache.set(10, 7)
    Cache.get(10).should == 7

    Cache.set(5, 6)
    Cache.get(5).should == 6

    Cache.get(10).should == 7

    Cache.has?(10).should == true
    Cache.has?(99).should == false
  end
end