def remove_paren (txt)
	result = ""
	while true do
		paren_idx = txt.index('(')
		a_idx = txt.index('<a')

		if paren_idx == nil and a_idx == nil then
			result << txt
			break
		elsif paren_idx == nil then
			result << txt
			break
		elsif  a_idx == nil or paren_idx < a_idx then
			result << txt[0..paren_idx]
			close_paren_idx = txt.index(')', paren_idx+1)
			txt = txt[close_paren_idx..-1]
		else
			close_a_idx = txt.index('>', a_idx+1)
			result << txt[0..close_a_idx]
			txt = txt[close_a_idx+1..-1]
		end
	end
	result
end

require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/Python_(programming_language)'))

while true do
	html = doc.css('div#mw-content-text p').inner_html
	html = remove_paren(html)

	new_doc = Nokogiri::HTML(html)	
	link = new_doc.css('a').first

	puts "#{link.content} - #{link['href']}"
	break if link.content == 'philosophy'

	doc = Nokogiri::HTML(open('http://en.wikipedia.org' + link['href']))
end