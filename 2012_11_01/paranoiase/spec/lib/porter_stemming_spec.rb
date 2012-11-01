require 'spec_helper'
require './lib/porter_stemming'

describe PoterStemming do
  describe "#count_m" do
    it "should count m. the count of consonant+vowel" do
      PoterStemming.new("feed").count_m.should == 0
      PoterStemming.new("agreed").count_m.should == 1
    end
  end

  describe "#v_contained?" do
    it "should check if vowel is contained" do
      PoterStemming.new("feed").should be_v_contained(/^(.*)(ed)$/)
      PoterStemming.new("bled").should be_v_contained(/^(.*)(ed)$/)
      PoterStemming.new("plastered").should_not be_v_contained(/^(.*)(ed)$/)
    end
  end
end