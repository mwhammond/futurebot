class FeedEntry <ActiveRecord::Base
	def sekf.update_from_feed(feed_url)
		feed = Feedzirra::Feed.fetch_and_parse(feed_url)
		feed.entries.each do |entry|
			unless exists? :guid => entry.id
				create!(
					:name => entry.title,
					:summary => entry.summary,
					:feed_url => entry.url,
					:published_at => entry.published,
					:guid => entry.id
					)		
			end
		end
	end
end
