require "spec_helper"
require "benchmark"

require "amicable_pair"

describe AmicablePair do
  let(:number) { 1000 }  
  let(:pair) { AmicablePair.new(number) }

  describe "#sum_table" do
    
    it "sum table test" do
      pair.sum_table[2].should == 1
      pair.sum_table[3].should == 1
      pair.sum_table[4].should == 3
      pair.sum_table[220].should == 284
      pair.sum_table[284].should == 220
    end
  end

  describe "#result" do
    let(:number) {10000}
    it "armicable pair test" do
      AmicablePair.new(10).result.should == []
      AmicablePair.new(1000).result.should == [[220, 284]]
      AmicablePair.new(10000).result.should == [[220, 284], [1184, 1210], [2620, 2924], [5020, 5564], [6232, 6368]]
    end

    it "benchmark" do
      p Benchmark.measure { AmicablePair.new(20000).result }
    end
  end

end


describe Fixnum do
  describe "#real_submultiples" do
    it "real_submultiples test" do
      284.real_submultiples.sort.should == [1, 2, 4, 71, 142]
      220.real_submultiples.sort.should == [1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110]
      10.real_submultiples.sort.should == [1,2,5]
      8.real_submultiples.sort.should == [1,2,4]
      6.real_submultiples.sort.should == [1,2,3]
      4.real_submultiples.sort.should == [1,2]
      3.real_submultiples.sort.should == [1]
      2.real_submultiples.sort.should == [1]
      1.real_submultiples.sort.should == [1]
    end

    it "benchmark" do
      p Benchmark.measure { 1000.times { 220.real_submultiples } }
    end
  end
end