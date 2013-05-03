require 'rubygems'
require 'nokogiri'
require 'open-uri'
puts "scraping"

url = "http://www.telecoms.com/38436/lte-and-the-backhaul-challenge/"

doc = Nokogiri::HTML(open(url))

#puts doc.xpath '//p/text()'

#puts doc.at_css("p").text

doc.css("p").each do |para|
	puts para.text
	puts "--------------------------"
end
