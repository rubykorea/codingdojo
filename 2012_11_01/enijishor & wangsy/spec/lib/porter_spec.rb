require 'spec_helper'
require 'porter'

describe Porter do
  describe '#porter' do
    it "should convert 'caresses' to 'caress'" do
      Porter.new('caresses').convert.should == 'caress'
    end
    it "should convert 'ponies' to 'poni'" do
      Porter.new('ponies').convert.should == 'poni'
    end
    it "should convert 'carress' to 'carress'" do
      Porter.new('carress').convert.should == 'carress'
    end
    it "should convert 'cats' to 'cat'" do
      Porter.new('cats').convert.should == 'cat'
    end
    it "should convert 'feed' to 'feed'" do
      Porter.new('feed').convert.should == 'feed'
    end
    it "should convert 'agreed' to 'agree'" do
      Porter.new('agreed').convert.should == 'agree'
    end

    it "should m_value('feed') to 1" do
      Porter.new('feed').m_value.should == 1
    end

    it "should m_value('agreed') to 2" do
      Porter.new('agreed').m_value.should == 2
    end

    it "should convert 'plastered' to 'plaster'" do
      Porter.new('plastered').convert.should == 'plaster'
    end

    it "should convert 'bled' to 'bled'" do
      Porter.new('bled').convert.should == 'bled'
    end

    it "should convert 'motoring' to 'motor'" do
      Porter.new('motoring').convert.should == 'motor'
    end

    it "should convert 'sing' to 'sing'" do
      Porter.new('sing').convert.should == 'sing'
    end


    it "should convert 'conflated' to 'conflate'" do
      Porter.new('conflated').convert.should == 'conflate'
    end


    it "should convert 'conflated' to 'conflate'" do
      Porter.new('conflated').convert.should == 'conflate'
    end


    it "should convert 'troubling' to 'trouble'" do
      Porter.new('troubling').convert.should == 'trouble'
    end


    it "should convert 'sized' to 'size'" do
      Porter.new('sized').convert.should == 'size'
    end


    it "should convert 'tanned' to 'tan'" do
      Porter.new('tanned').convert.should == 'tan'
    end


    it "should convert 'hopping' to 'hop'" do
      Porter.new('hopping').convert.should == 'hop'
    end


    it "should convert 'failing' to 'fail'" do
      Porter.new('failing').convert.should == 'fail'
    end


    it "should convert 'filing' to 'file'" do
      Porter.new('filing').convert.should == 'file'
    end
    

  end
end



