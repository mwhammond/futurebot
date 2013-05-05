

CharacterFollow = 30;

	def buildContent

	puts "finding feeds to update"
	### send urls from database to update_from_feed ####

	# get urls from database
	# each of these needs a lastChecked date object
	update_from_feed("http://feeds.feedburner.com/TechCrunch/") # change to multiple?
	# returns value of last statement executed
end



	### get latest feeds and store in ##############

	def update_from_feed(feed_url)
		puts "pulling feeds"
		puts feed_url
		# add something to handle if it doesn't work
		feed = Feedzirra::Feed.fetch_and_parse(feed_url)
		puts feed.title
		# feed.last_modified - if it's been modified since last time
		feed.entries.each do |entry|
			# if the post occured after it was last checked
			# check that it's a decent length
			find_keywords(entry.url)
			puts entry.url	
		end
end


### scrape page and use regex to extract ########

def find_keywords(feedEntryUrl)
	puts "extracting keywords"
	doc = Nokogiri::HTML(open(feedEntryUrl))
	# LOAD THE DICTIONARY OF KEYWORDS
	doc.css("p").each do |para|
	paraString = para.to_s	
	# use regex to find the keywrods and end of sentences - probably could be more effecient!	
	# CHANGE TO DYNAMIC KEYWORD! 
	# AND FIX PLURALS! - put them all in with an 'or'?

	positions = paraString.enum_for(:scan, /\bGlass\b|\bglass[s]/).map { Regexp.last_match.begin(0) }
	dots = paraString.enum_for(:scan, /[\.\?\!]/).map { Regexp.last_match.begin(0) }

	# find the end of a sentence immediatly before a keyword
	# maybe check that it's not a title by having a few fullstops in a P
	positions.each do |position|
		puts "dots"
		puts dots
		puts "position"
		puts position
		puts "paraString"
		puts paraString 

		dotBefore = dots.find_all {|i| i< position}.max
		dotBefore=0 if dotBefore.nil? # start of string if no punctuation before

		puts "dots before"
		puts dotBefore

		puts "final string"
		puts paraString[dotBefore+2, position+CharacterFollow]+"..."
		# if result # Post.create!(:title => "test",:content => "test",:contentSummary => para.text,:score => 1, :image => "radio.jpg",:link => "www.google.com")
	end



		
	end

end


puts buildContent

