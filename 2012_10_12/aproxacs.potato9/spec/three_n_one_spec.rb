require "spec_helper"

require "three_n_one"
describe ThreeNOne do
  let(:min) { 1 }
  let(:max) { 100000 }
  let(:obj) { ThreeNOne.new(min, max) }

  it "the cycle length of 1 is 1" do
    obj.cycle_length(1).should == 1  
  end

  it "has the table of cycle length" do
    obj.cycle_length_hash.should_not be_nil

    obj.calculate_hash
    obj.cycle_length_hash[22].should ==16
  end

  it 'should find max number from cycle hash' do
    obj = ThreeNOne.new(1,1)
    obj.calculate_hash
    obj.max_length.should == 1
  end


  it "should calculate fast" do
    obj = ThreeNOne.new(1, 1000)
    obj.calculate_hash

    obj.working_time.should < 0.005
  end

  it "the max length of " do
    obj.calculate_hash

    obj.max_length.should == 179
  end

  it 'cycle_length test' do
    obj.calculate_hash
    {
      638=>57,
      639=>132,
      640=>13,
      641=>52,
      642=>26,
      643=>26,
      644=>101,
      645=>101,
      646=>101,
      647=>39,
      648=>26,
      649=>145,
      650=>26,
      651=>101,
      652=>26,
      653=>26,
      654=>145,
      655=>145,
      656=>114,
      657=>52,
      658=>52,
      659=>52,
      660=>114,
      661=>114,
      662=>26,
      663=>26,
      664=>114,
      665=>52,
      666=>114,
      667=>145,
      668=>70,
      669=>70,
      670=>70,
      671=>96
    }.each {|k,v| obj.cycle_length(k).should == v}
  end
end
