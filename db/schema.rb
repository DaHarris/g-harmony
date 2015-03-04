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

ActiveRecord::Schema.define(version: 20150304230936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "assignments", ["post_id"], name: "index_assignments_on_post_id", using: :btree
  add_index "assignments", ["tag_id"], name: "index_assignments_on_tag_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string  "description"
    t.integer "user_id"
    t.integer "post_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "url"
    t.string   "code"
    t.string   "description"
    t.string   "title"
    t.datetime "timestamp_field"
    t.integer  "user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
  end

  create_table "users", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "username"
    t.string  "password_digest"
    t.boolean "admin",           default: false, null: false
  end

  add_foreign_key "assignments", "posts"
  add_foreign_key "assignments", "tags"
end
