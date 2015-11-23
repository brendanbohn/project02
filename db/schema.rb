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


ActiveRecord::Schema.define(version: 20151123193415) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "bio"
    t.string   "gender"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "response"
    t.string   "agreement"
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compatabilities", force: :cascade do |t|
    t.integer  "score"
    t.integer  "user_id"
    t.integer  "questionnaire_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.integer  "group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "members"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "content"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "question1"
    t.string   "question2"
    t.string   "question3"
    t.string   "question4"
    t.string   "question5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "city"
    t.string   "password_digest"
    t.string   "email"
    t.text     "bio"
    t.string   "username"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "image"
    t.string   "slug"
    t.text     "mission_statement"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

end
