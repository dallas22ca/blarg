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

ActiveRecord::Schema.define(:version => 20121107203840) do

  create_table "designs", :force => true do |t|
    t.text     "css"
    t.text     "js"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "token"
    t.string   "name"
  end

  create_table "media", :force => true do |t|
    t.integer  "site_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "image_width"
    t.integer  "image_height"
  end

  add_index "media", ["site_id"], :name => "index_media_on_site_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "site_id"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "permalink"
    t.integer  "pattern_id"
    t.integer  "ordinal"
  end

  add_index "pages", ["ordinal"], :name => "index_pages_on_ordinal"
  add_index "pages", ["pattern_id"], :name => "index_pages_on_pattern_id"
  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"

  create_table "patterns", :force => true do |t|
    t.text     "html"
    t.integer  "design_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  add_index "patterns", ["design_id"], :name => "index_patterns_on_design_id"

  create_table "sections", :force => true do |t|
    t.integer  "ordinal"
    t.integer  "page_id"
    t.text     "html"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "element"
  end

  add_index "sections", ["ordinal"], :name => "index_sections_on_ordinal"
  add_index "sections", ["page_id"], :name => "index_sections_on_page_id"
  add_index "sections", ["site_id"], :name => "index_sections_on_site_id"

  create_table "sites", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "permalink"
    t.integer  "design_id"
  end

  add_index "sites", ["permalink"], :name => "index_sites_on_permalink"

  create_table "siteships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "siteships", ["site_id"], :name => "index_siteships_on_site_id"
  add_index "siteships", ["user_id"], :name => "index_siteships_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "widgets", :force => true do |t|
    t.integer  "section_id"
    t.string   "style"
    t.integer  "ordinal"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "html"
  end

  add_index "widgets", ["ordinal"], :name => "index_widgets_on_ordinal"
  add_index "widgets", ["section_id"], :name => "index_widgets_on_section_id"

end
