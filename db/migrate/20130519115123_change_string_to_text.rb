class ChangeStringToText < ActiveRecord::Migration
  def up
  	change_column :posts, :content, :text
  	change_column :posts, :contentSummary, :text
  	change_column :posts, :link, :text

  end

  def down
  	change_column :posts, :content, :string
  	change_column :posts, :contentSummary, :string
  	change_column :posts, :link, :string
  end
end
