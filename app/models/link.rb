class Link < ActiveRecord::Base
  attr_accessible :tags, :title, :url, :lastchecked
end
