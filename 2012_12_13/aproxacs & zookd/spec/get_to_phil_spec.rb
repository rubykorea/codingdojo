require "get_to_phil"

describe GetToPhil do
  let(:root) { File.dirname(__FILE__) }
  let(:url) { "http://en.wikipedia.org/wiki/Python_(programming_language)" }
  let(:phil) { GetToPhil.new(url) }

  it "Cat link test" do
    phil = GetToPhil.new("http://en.wikipedia.org/wiki/Cat")
    phil.go
  end

  describe "#prase_first_link" do
    let(:content) { Nokogiri::HTML(html).css("#mw-content-text > p") }
    before(:each) do
      phil.content = content
      phil.send(:parse_first_link)
    end

    describe "cat link" do
      let(:html) { File.read File.join(root, "data/cat.html") }
      it "first_link is Fur" do
        phil.first_link.should == "http://en.wikipedia.org/wiki/Fur"
      end
    end

    describe "fact link" do
      let(:html) { File.read File.join(root, "data/fact.html") }
      it "first_link is Proof" do
        phil.first_link.should == "http://en.wikipedia.org/wiki/Proof_(truth)"
      end
    end

    describe "subjectivity link" do
      let(:html) { File.read File.join(root, "data/subjectivity.html") }
      it "first_link is Subject" do
        phil.first_link.should == "http://en.wikipedia.org/wiki/Subject_(philosophy)"
      end
    end
  end

  describe "#remove_parenthesis" do
    let(:content) { Nokogiri::HTML(html) }
    before(:each) do
      phil.content = content
      phil.send(:remove_parenthesis)
    end

    context "when parenthesis incluses link" do
      let(:html) { "<div>hello (this <a href='http://www'>is</a> link) world</div>" }
      it "removes link" do
        phil.content.css("a").count.should == 0
      end
    end

    context "when link has parenthesis" do
      let(:html) { "<div>hello this <a href='http://www'>i(s)</a> link world</div>" }
      it "does not remove link" do
        phil.content.css("a").count.should == 1
      end
    end

    context "when parenthesis are more than one" do
      let(:html) { "<div>hello (this) <a href='http://www'>is</a> (link) world</div>" }
      it "removes each parenthesis" do
        phil.content.css("a").count.should == 1
      end
    end

    context "when link's href has parenthesis" do
      let(:html) { "<div>hello (this) <a href='http://en.wikipedia.org/wiki/Proof_(truth)'>is</a> (link) world</div>" }
      it "does not change href" do
        phil.content.css("a").first.attribute("href").value.should == "http://en.wikipedia.org/wiki/Proof_(truth)"
      end
    end
  end

  describe "#remove_italic" do
    let(:content) { Nokogiri::HTML(html) }
    before(:each) do
      phil.content = content
      phil.send(:remove_italic)
    end

    context "when html has dablink element" do
      let(:html) { "<div>hello <div class='dablink'>this <a href='http://www'>is</a> link</div> world</div>" }
      it "removes .dablink element" do
        phil.content.css(".dablink").count.should == 0
      end
    end

    context "when html has rellink element" do
      let(:html) { "<div>hello <div class='rellink'>this <a href='http://www'>is</a> link</div> world</div>" }
      it "removes .rellink element" do
        phil.content.css(".dablink").count.should == 0
      end
    end

    context "when html has i link" do
      let(:html) { "<div>hello <i>this <a href='http://www'>is</a> link</i> world</div>" }
      it "removes i element" do
        phil.content.css(".dablink").count.should == 0
      end
    end
  end

  describe "#remove_sup" do
    let(:html) { "<div>hello <sup>this <a href='http://www'>is</a> link</sup> world</div>" }
    let(:content) { Nokogiri::HTML(html) }
    before(:each) do
      phil.content = content
      phil.send(:remove_sup)
    end

    it "removes sup element" do
      phil.content.css("sup").count.should == 0
    end
  end

end
