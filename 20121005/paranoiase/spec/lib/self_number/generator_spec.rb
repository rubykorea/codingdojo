require './lib/self_number/generator'

describe SelfNumber::Generator do
  describe "class methods" do
    subject { SelfNumber::Generator }

    describe "##generate_cache_table" do
      it "should genereate cache_table of self numbers" do
        table = subject.generate_cache_table(1, 3)
        table.should == {1 => nil, 2 => [1], 4 => [2], 3 => nil, 6 => [3]}
      end
    end

    describe "##d" do
      it "should return calculated value" do
        subject.d(91).should == 101
      end
    end
  end

  describe "instance methods" do
    subject { SelfNumber::Generator.new(1, 10) }

    describe "#self_number?" do
      it { should be_self_number(1) }
      it { should be_self_number(3) }
      it { should_not be_self_number(2) }
    end

    describe "#self_numbers" do
      it "should find all self numbers" do
        subject.self_numbers.should == [1, 3, 5, 7, 9]
      end
    end

    describe "#sum" do
      it "should return sum of all self numbers" do
        subject.sum.should == 25
      end
    end
  end
end