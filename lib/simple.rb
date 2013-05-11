#class Simple <ActiveRecord::Base

CharacterFollow = 30;

RetailLinks = ["http://www.telecoms.com/feed/"]
Sector = ["telecoms"]





	### get latest feeds and store in ##############

	def update_from_feed(feed_url)
		puts "pulling feeds"
		puts feed_url
		# add something to handle if it doesn't work
		# CHECK FOR AND REMOVE SPECIAL CHARACTERS

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
	doc.xpath('//@style').remove
	doc.css("p").each do |para|
	#paraString = para.to_s	
	paraString = para.text
	# use regex to find the keywrods and end of sentences - probably could be more effecient!	
	# CHANGE TO DYNAMIC KEYWORD! 
	# AND FIX PLURALS! - put them all in with an 'or'?

	positions = paraString.enum_for(:scan, /\bdata\b/).map { Regexp.last_match.begin(0) }
	dots = paraString.enum_for(:scan, /[\.\?\!]/).map { Regexp.last_match.begin(0) }

	# find the end of a sentence immediatly before a keyword
	
	if dots.length >=1 # maybe check that it's not a title by having a few fullstops in a P

	positions.each do |position|

		dotBefore = dots.find_all {|i| i< position}.max
		dotBefore=-2 if dotBefore.nil? # start of string if no punctuation before
		# if it's the last sentence we might actually want to go back one

		result = paraString[dotBefore+2, position+CharacterFollow]+"..."

		puts paraString
		Post.create!(:title => "bam",:content => paraString,:contentSummary => result,:score => 1, :image => "radio.jpg",:link => feedEntryUrl, :tags => "telecoms") 
	
	end #each

	end #if a few sentences



		
	end

end



RetailLinks.each do |link|
	update_from_feed(link)
end

#end #class