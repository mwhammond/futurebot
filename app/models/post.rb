class Post < ActiveRecord::Base
  attr_accessible :content, :contentSummary, :image, :link, :score, :title, :tags_attributes

  has_many :comments
  has_many :tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
  :reject_if => proc { |attrs| attrs.all? { |k,v| v.blank?} }




end
