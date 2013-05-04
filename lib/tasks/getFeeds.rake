desc "fetch feeds"
task :fetch_feeds => :environment do
	FeedEntry.update_from_feed("http://feeds.feedburner.com/railscasts")
end