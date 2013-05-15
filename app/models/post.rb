class Post < ActiveRecord::Base
  attr_accessible :content, :contentSummary, :image, :link, :score, :title, :tags, :datefound

  has_many :comments



end
