require 'spec_helper'
require './lib/string'

describe String do
  describe '#stem' do
    it { "caresses".stem.should == "caress" }
    it { "caressessses".stem.should == "caressesss" }
  end

  describe '#stem_1a_102' do
    it { "ponies".stem.should == "poni" }
  end

  describe '#stem_1a_103' do
    it { "caress".stem.should == "caress" }
  end

  describe '#stem_1a_104' do
    it { "cats".stem.should == "cat" }
  end

  describe '#stem_1b_105' do
    it { "feed".stem.should == "feed" }
    it { "agreed".stem.should == "agree" }
  end

  describe '#stem_1b_106' do
    it { "plastered".stem.should == "plaster" }
    it { "bled".stem.should == "bled" }
  end

  describe '#stem_1b_107' do
    it { "motoring".stem.should == "motor" }
    it { "sing".stem.should == "sing" }
  end
end