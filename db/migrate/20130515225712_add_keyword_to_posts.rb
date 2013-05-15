class AddKeywordToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :keyword, :string
  end
end
