desc "fetch feeds"
task :fetch_feeds => :environment do

require 'nokogiri'
require 'open-uri'
require 'Feedzirra'
require 'simple.rb'

	Simple.buildContent

end