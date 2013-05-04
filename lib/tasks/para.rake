desc "fetch paragraphs"
task :fetch_para => :environment do


=begin

	require 'nokogiri'
	require 'open-uri'

	puts "scraping"

	url = "http://www.telecoms.com/38436/lte-and-the-backhaul-challenge/"
	doc = Nokogiri::HTML(open(url))
	doc.css("p").each do |para|
		# look for keywords and extract sentence
		Post.create!(:title => "test",:content => "test",:contentSummary => para.text,:score => 1, :image => "radio.jpg",:link => "www.google.com")
	end
end

# dynamic url:  url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=#{CGI.escape(product.name)}&Find.x=0&Find.y=0&Find=Find"

def findKeywords(para)
	keyword="challenge" # change to array and 'do' later
	reKeyword = new RegExp(keyword,"g")
	reDots = /[\.\?\!]/g;

	
	# find index of keyword - deal with multiple occurences later
		#indexOfKeyword=findInPara(re)
	# find the start and end of setences
	# put the setence between start and finish in a var
		# fullSentence=extractSentences(indexKeywords[i],endOfSentences,para);
	# save to database

end

#################### old code

# call using methodName 25,30




// functions ///////////////////////////////////////////

// finds multiple occurences of something in a para using regex
function findInPara(re) {
	things=[];
	while ((match = re.exec(para)) != null) {
	things.push(match.index);
    //console.log("match at " + match.index);
	}
	return things; 
} // findInPara


function extractSentences(indexKeywords,endOfSentences,para) {
# i.e. find the stop before and after keyword

	// find the sentence end before the word
	var stopBefore = _.filter(endOfSentences, function(num){ return num<indexKeywords; });
	stopBefore=Math.max.apply(Math, stopBefore);

	// find the sentence end after the word	
	var stopAfter = _.filter(endOfSentences, function(num){ return num>indexKeywords; });
	stopAfter=Math.min.apply(Math, stopAfter);

	//console.log('Stop before: '+stopBefore+ ', stop after:' +stopAfter)

	return para.substring(stopBefore+2,stopAfter);

} // extract sentences
=end


end