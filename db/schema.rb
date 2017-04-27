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

ActiveRecord::Schema.define(version: 20170319152512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.text     "story"
    t.string   "image"
    t.string   "filter"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "opt_in",     default: true
  end

  create_table "entries", force: :cascade do |t|
    t.string   "name"
    t.text     "story"
    t.integer  "user_id"
    t.string   "avatar"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "filter"
    t.string   "title"
    t.string   "filter_no_hashtag"
    t.string   "location"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer  "entry_id"
    t.integer  "user_id"
    t.string   "quiz_ip"
    t.string   "email"
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "oauth_expires_at"
    t.string   "postal_code"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.string   "state"
    t.boolean  "terms_conditions"
    t.string   "last_name"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "entry_id"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "voter_ip"
    t.string   "email"
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
  end

end
