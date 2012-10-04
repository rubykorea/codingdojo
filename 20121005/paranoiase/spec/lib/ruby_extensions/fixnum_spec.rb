require './lib/ruby_extensions/fixnum'

describe Fixnum do
  describe "#to_digits" do
    100.to_digits.should == [1, 0, 0]
  end
end