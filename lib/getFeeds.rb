class Getfeeds

	require 'nokogiri'
	require 'open-uri'
	require 'uri'




	def self.verySimple
		puts "nothing"
	end

def self.buildContent

	puts "finding feeds to update"
	### send urls from database to update_from_feed ####

	# get urls from database
	# each of these needs a lastChecked date object
	Getfeeds.update_from_feed("http://www.wired.co.uk/rss") # change to multiple?
	# returns value of last statement executed
end





### get latest feeds and store in ##############

def self.update_from_feed(feed_url)
	puts "pulling feeds"
	feed = Feedzirra::Feed.fetch_and_parse(feed_url)
		# feed.last_modified - if it's been modified since last time
		feed.entries.each do |entry|
			# if the post occured after it was last checked
			Getfeeds.find_keywords(entry.url)
			puts entry.url
			# call the keyword check and save on the actual post url	
		end
	end






### scrape page and use regex to extract ########

def self.find_keywords(feedEntryUrl)
	puts "extracting keywords"
	doc = Nokogiri::HTML(open(feedEntryUrl))
	doc.css("p").each do |para|
		# regex on para if true extract and save
		# for now just save the p tags
		Post.create!(:title => "test",:content => "test",:contentSummary => para.text,:score => 1, :image => "radio.jpg",:link => "www.google.com")
	end

end



end

#FeedEntry.update_from_feed("http://feeds.feedburner.com/railscasts")

Getfeeds.verySimple