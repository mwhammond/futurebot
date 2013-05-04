class FeedEntry <ActiveRecord::Base
	attr_accessible :name, :summary, :url, :published_date, :guid

	def self.update_from_feed(feed_url)
		feed = Feedzirra::Feed.fetch_and_parse(feed_url)
		feed.entries.each do |entry|
			unless exists? :guid => entry.id
				create!(
					:name => entry.title,
					:summary => entry.summary,
					:url => entry.url,
					:published_date => entry.published,
					:guid => entry.id
					)		
				puts entry.title
			end
		end
	end
end

#ep 164 use a cron job