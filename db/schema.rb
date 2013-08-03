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

ActiveRecord::Schema.define(version: 20130803175646) do

  create_table "meme_captions", force: true do |t|
    t.string   "upper_caption"
    t.string   "lower_caption"
    t.string   "font"
    t.integer  "meme_image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meme_captions", ["meme_image_id"], name: "index_meme_captions_on_meme_image_id", using: :btree

  create_table "meme_images", force: true do |t|
    t.string   "name"
    t.string   "meme"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
