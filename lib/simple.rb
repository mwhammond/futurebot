module Simple

puts "loaded"

CharacterFollow = 30;

	def buildContent

	puts "finding feeds to update"
	### send urls from database to update_from_feed ####

	# get urls from database
	# each of these needs a lastChecked date object
	update_from_feed("http://www.wired.co.uk/rss") # change to multiple?
	# returns value of last statement executed
end
module_function :buildContent


	### get latest feeds and store in ##############

	def update_from_feed(feed_url)
		puts "pulling feeds"
#	feed = Feedzirra::Feed.fetch_and_parse(feed_url)
		# feed.last_modified - if it's been modified since last time
	#	feed.entries.each do |entry|
			# if the post occured after it was last checked
			# check that it's a decent length
	#		find_keywords(entry.url)
	#		puts entry.url
			# call the keyword check and save on the actual post url	
	#	end
end
module_function :update_from_feed

### scrape page and use regex to extract ########

def find_keywords(feedEntryUrl)
	puts "extracting keywords"
	doc = Nokogiri::HTML(open(feedEntryUrl))
	doc.css("p").each do |para|
		# regex on para if true extract and save everytime a match is found
		# for now just save the p tags
		puts para
		# Post.create!(:title => "test",:content => "test",:contentSummary => para.text,:score => 1, :image => "radio.jpg",:link => "www.google.com")
	end

end
module_function :find_keywords

puts buildContent

end