require './lib/ruby_extensions/array'

describe Array do
  describe "#sum" do
    [1, 2, 3].sum.should == 6
  end
end