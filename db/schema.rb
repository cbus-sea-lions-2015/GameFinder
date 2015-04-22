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

ActiveRecord::Schema.define(version: 20150422152147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "bgg_id", null: false
  end

  create_table "favoritelibraries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "library_id"
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "minplaytime"
    t.integer  "maxplaytime"
    t.integer  "minplayers"
    t.integer  "maxplayers"
    t.text     "poll"
    t.string   "image_url"
    t.string   "thumbnail_url"
    t.string   "bgg_id",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "games_categories", force: :cascade do |t|
    t.integer "game_id"
    t.integer "category_id"
  end

  create_table "games_libraries", force: :cascade do |t|
    t.integer "game_id"
    t.integer "library_id"
  end

  create_table "games_mechanics", force: :cascade do |t|
    t.integer "game_id"
    t.integer "mechanic_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "bgg_username"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.string "bgg_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 16
    t.string   "handle",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "auth0_id"
    t.integer  "library_id"
  end

end
