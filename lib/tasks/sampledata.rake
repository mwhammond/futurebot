namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
	require 'faker'
	Rake::Task['db:reset'].invoke
	10.times do |n|
		headline = Faker::Lorem.words(5)
		video = Faker::Lorem.sentence(4)
		Post.create!(:title => headline,:content => video,:contentSummary => video,
			:score => 1,:image => "radio.jpg",:link => "www.google.com")
	end
	end
 end

# title:string
# content:text
# contentSummary:text
# score:integer
# image:string
# link:string