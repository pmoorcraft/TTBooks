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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150309235702) do

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "amazon"
    t.string   "author"
    t.string   "publisher"
    t.date     "release"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "tag"
    t.string   "header"
    t.string   "type"
  end

  add_index "books", ["title"], name: "index_books_on_title"

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.text     "description"
    t.date     "uploaded"
    t.text     "speakers"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "tag"
    t.string   "header"
    t.string   "type"
  end

  add_index "videos", ["title"], name: "index_videos_on_title"

end
