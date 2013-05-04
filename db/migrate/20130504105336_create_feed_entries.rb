class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.string :name
      t.text :summary
      t.string :url
      t.datetime :published_date
      t.string :guid

      t.timestamps
    end
  end
end
