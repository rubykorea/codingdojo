require "spec_helper"


require "amicable_pair"
describe AmicablePair do
  let(:number) { 1000 }  
  let(:pair) { AmicablePair.new(number) }
  describe "#initialize" do
    
    it "is initialized with number" do
      AmicablePair.new(number)
    end
  end

  describe "#submultiples" do

    context "when target number is 220" do
      let(:target) { 220 }
      it "is [1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110]" do
        pair.submultiples(target).should == [1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110]  
      end
    end

    context "when target number is 284" do
      let(:target) { 284 }
      it "is [1, 2, 4, 71, 142]" do
        pair.submultiples(target).should == [1, 2, 4, 71, 142]  
      end
    end
  end

  describe "#all_pairs" do
    
    it "does something" do
      pair.all_pairs[220].should == 284
      pair.all_pairs[284].should == 220
    end
  end

  describe "#result", focus: true do
    let(:number) {10000}
    it "does something" do
      pair.result.should include([220, 284])
      pair.result.should_not include([284, 220])
    end
  end

end

