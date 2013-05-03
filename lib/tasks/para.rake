desc "fetch paragraphs"
task :fetch_para => :environment do

	require 'nokogiri'
	require 'open-uri'

	puts "scraping"

	url = "http://www.telecoms.com/38436/lte-and-the-backhaul-challenge/"
	doc = Nokogiri::HTML(open(url))
	doc.css("p").each do |para|
		puts para.text
		puts "--------------------------"
		Post.create!(:title => "test",:content => "test",:contentSummary => para.text,:score => 1, :image => "radio.jpg",:link => "www.google.com")

	end

end

# dynamic url:  url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=#{CGI.escape(product.name)}&Find.x=0&Find.y=0&Find=Find"
#  9       Video.create!(:headline => headline,
# 10                   :video => video)