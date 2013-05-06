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

ActiveRecord::Schema.define(:version => 20130506215132) do

  create_table "bases", :force => true do |t|
    t.string  "name"
    t.boolean "enabled",     :default => true
    t.text    "description"
  end

  create_table "events", :force => true do |t|
    t.text    "students"
    t.integer "amount"
    t.text    "description"
  end

  create_table "orders", :force => true do |t|
    t.string   "type"
    t.string   "current_study_group"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "actual_social_activity"
    t.integer  "user_id"
    t.integer  "orderable_id"
    t.string   "orderable_type"
  end

  create_table "resorts", :force => true do |t|
    t.integer "tour_id"
  end

  create_table "sanatoria", :force => true do |t|
    t.integer "tour_id"
  end

  create_table "social_activities", :force => true do |t|
    t.string  "name"
    t.boolean "enabled"
    t.text    "description"
  end

  create_table "subsidies", :force => true do |t|
    t.integer "subsidy_type_id"
    t.integer "basis_id"
  end

  create_table "subsidy_types", :force => true do |t|
    t.string  "name"
    t.boolean "enabled"
    t.text    "description"
  end

  create_table "tours", :force => true do |t|
    t.string  "type"
    t.date    "startdate"
    t.date    "enddate"
    t.string  "name"
    t.boolean "enabled"
    t.integer "tourable_id"
    t.string  "tourable_type"
  end

  create_table "transport_subsidies", :force => true do |t|
    t.string "departure"
    t.string "arrival"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "phone"
    t.string   "academy_group"
    t.string   "bank_account"
    t.string   "passport"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.string   "building"
    t.string   "apartments"
    t.string   "study_type"
    t.boolean  "have_debts"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "social_activity"
    t.integer  "social_activity_id"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
