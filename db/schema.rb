# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130525110649) do

  create_table "comments", :force => true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "feed_entries", :force => true do |t|
    t.string   "name"
    t.text     "summary"
    t.string   "url"
    t.datetime "published_date"
    t.string   "guid"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "keywords", :force => true do |t|
    t.string   "word"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "tags"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.date     "lastchecked"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "contentSummary"
    t.integer  "score"
    t.string   "image"
    t.text     "link",           :limit => 255
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "tags"
    t.date     "datefound"
    t.string   "keyword"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["post_id"], :name => "index_tags_on_post_id"

end
