require 'nokogiri'
require 'open-uri'

class GetToPhil
  attr_accessor :result, :content
  attr_reader :first_link, :history

  def initialize(url)
    @history = [url]
  end

  def go
    loop do
      get_content
      parse_first_link

      break if loop? 
      if reached?
        reached!
        break
      end

      go_next
    end

    self
  end

  def reached?
    first_link == goal_url
  end


  private
  def loop?
    @history.include? first_link
  end

  def reached!
    @history << @first_link
    puts " => Reached Philosophy link!!!!!!!!!!"
    puts "History"
    puts "-" * 80
    puts @history.join("\n")
    puts "-" * 80
    
  end


  def get_content
    p "get url : #{@history.last}"
    doc = Nokogiri::HTML(open(@history.last))
    @content = doc.css("#mw-content-text > p")
  end

  def goal_url
    "http://en.wikipedia.org/wiki/Philosophy"
  end

  def go_next
    @history << first_link
  end

  def parse_first_link
    remove_italic
    remove_sup
    
    # p @content.css("a").text[0..80]
    remove_parenthesis
    # p @content.css("a").text[0..80]
    
    # p @content.css("a").count
    # p @content.css("a").first.attribute("href").value

    @first_link = "http://en.wikipedia.org" + @content.css("a").first.attribute("href").value
  end

  def remove_parenthesis
    html = @content.inner_html
    html.gsub!(/\([^)]*<a[^>]*>(.*?)<\/a>[^)]*\)/, "")
    @content =  Nokogiri::HTML(html)
  end

  def remove_italic
    @content.css(".dablink, .rellink, i").remove
  end

  def remove_sup
    @content.css("sup").remove
  end

end
