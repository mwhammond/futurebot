class Post < ActiveRecord::Base
  attr_accessible :content, :contentSummary, :image, :link, :score, :title, :tags

  has_many :comments

def self.search(search)
  search_condition ="%" + search + "%"
  find(:all, :conditions => ['tags LIKE ?', search_condition])
end

end
