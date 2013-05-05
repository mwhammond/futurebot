require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'feedzirra'

url = "http://www.telecoms.com/38436/lte-and-the-backhaul-challenge/"

doc = Nokogiri::HTML(open(url))

puts "scraping..."

doc.css("p").each do |para|

	# look for keywords

	#re = "keyword"
	#para2="Pointless start. This is a test string it has two keywords, one here, another keyword here! This is a second sentence with nothing in it."
	#puts para.text =~ /#{Regexp.escape(re)}/
	#puts para.text =~ /[\.\?\!]/


	#punctuation or begining of string, any characters, keyword, anycharacters, punctuation
	
end

	re = "keyword"
	para2="Pointless start. This is a test string it has two keywords, one here, another keyword here! This is a second sentence with nothing in it."
	#puts para.text =~ /#{Regexp.escape(re)}/
	#puts para.text =~ /[\.\?\!]/
	puts para2.scan(/#{Regexp.escape(re)}/)
	puts para2.scan(/[\S*\s*{1,10}*.\.\?\!]/m)
	# precediing item optional =?
	# repeats the previous item zero or more times *
	# [\.\?\!].*\bkeyword\b[\.\?\!]

puts "done."
