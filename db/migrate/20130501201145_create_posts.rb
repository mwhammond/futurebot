class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :contentSummary
      t.integer :score
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
