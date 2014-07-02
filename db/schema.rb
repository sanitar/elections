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

ActiveRecord::Schema.define(version: 20140630183315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "user_id"
    t.boolean  "visiable",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "codes", force: true do |t|
    t.string   "value"
    t.string   "role_id"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversation_statuses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", force: true do |t|
    t.integer  "user_id"
    t.integer  "voter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id"
  end

  create_table "data_packets", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "packet_file_name"
    t.string   "packet_content_type"
    t.integer  "packet_file_size"
    t.datetime "packet_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",              default: 0
  end

  create_table "educations", force: true do |t|
    t.integer  "school_vk_id"
    t.integer  "voter_id"
    t.integer  "year_from"
    t.integer  "year_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patterns", force: true do |t|
    t.text     "text"
    t.boolean  "first_name"
    t.boolean  "last_name"
    t.boolean  "middle_name"
    t.boolean  "district"
    t.boolean  "email"
    t.boolean  "mobile"
    t.boolean  "skype"
    t.boolean  "age"
    t.boolean  "sex"
    t.boolean  "conversation_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.integer  "vk_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "url"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id"
    t.string   "packet_file_name"
    t.string   "packet_content_type"
    t.integer  "packet_file_size"
    t.datetime "packet_updated_at"
    t.integer  "district_id",            default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "voter_statuses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voters", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.integer  "vk_id"
    t.string   "district"
    t.string   "email"
    t.string   "mobile"
    t.string   "skype"
    t.integer  "age"
    t.integer  "sex"
    t.boolean  "can_write"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id"
    t.integer  "conversation_status", default: 0
    t.string   "image_url"
    t.integer  "social_weight"
    t.datetime "bdate"
    t.datetime "last_seen"
  end

  add_index "voters", ["can_write"], name: "index_voters_on_can_write", using: :btree
  add_index "voters", ["district"], name: "index_voters_on_district", using: :btree
  add_index "voters", ["social_weight"], name: "index_voters_on_social_weight", using: :btree
  add_index "voters", ["vk_id"], name: "index_voters_on_vk_id", unique: true, using: :btree

end
