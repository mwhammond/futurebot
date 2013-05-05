desc "fetch feeds"
task :fetch_feeds => :environment do

require 'nokogiri'
require 'open-uri'
require 'feedzirra'

require 'simple.rb' # this runs the helper file that scrapes and saves, possibly not the best way!

#require "#{Rails.root}/app/lib/simple.rb"
#include Simple

end