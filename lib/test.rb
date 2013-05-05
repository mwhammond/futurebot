

para="Pointless start. This is a test string it has three keywords, one here, another keyword two here! This is a second sentence with nothing in it. Boom another sentence. Finally there is another keyword thee here. And a mini sentence."


CharacterFollow = 30;


positions = para.enum_for(:scan, /\bkeyword\b|\bkeyword[s]/).map { Regexp.last_match.begin(0) }
dots = para.enum_for(:scan, /[\.\?\!]/).map { Regexp.last_match.begin(0) }

# find the end of a sentence immediatly before a keyword
positions.each do |position|
	dotBefore = dots.find_all {|i| i< position}.max
	puts para[dotBefore+2, position+CharacterFollow]+"..."
end

	
	
	



# for pluruals - could be better! \bkeyword\b|\bkeyword[s]
# dots.min{|a,b|  (positions[1]-a).abs <=> (positions[1]-b).abs }
#matches = para.scan(/\bkeyword\b|\bkeyword[s]/)
