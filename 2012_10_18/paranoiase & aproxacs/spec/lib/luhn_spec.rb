require 'spec_helper'
require 'luhn'

describe Luhn do
  let(:number) { "79927398713" }
  let(:luhn) { Luhn.new(number) }

  describe "#valid?" do
    it "79927398713 is valid" do
      luhn = Luhn.new("79927398713")    
      luhn.should be_valid
    end

    it "number is allowed" do
      luhn = Luhn.new(79927398713)    
      luhn.should be_valid
    end

    it "dash is allowed" do
      luhn = Luhn.new("7992-7398-713")    
      luhn.should be_valid
    end

    it "79927398711 is not valid" do
      luhn = Luhn.new("79927398711")
      luhn.should_not be_valid
    end

    it "79927398703 is not valid" do
      luhn = Luhn.new("79927398703")
      luhn.should_not be_valid
    end

    it "79927398705 is valid" do
      luhn = Luhn.new("79927398705")
      luhn.should be_valid
    end
  end

  describe "#double_every_other" do
    it "7992739871 is 718947691672" do
      luhn.double_every_other.should == "718947691672"
    end
  end

  describe "#cumulated_number" do
    it "result of 79927398713 is 67" do
      luhn.cumulated_number.should == 67
    end
  end

  describe "#check_digit" do
    it "result of 79927398713 is 3" do
      luhn.check_digit.should == 3
    end
  end
end