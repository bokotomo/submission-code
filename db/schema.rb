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

ActiveRecord::Schema.define(:version => 20160908203432) do

  create_table "skill_check_users", :force => true do |t|
    t.integer  "receive_user_id"
    t.integer  "send_user_id"
    t.integer  "skill_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "skill_infos", :force => true do |t|
    t.string   "skill_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "titles", :force => true do |t|
    t.string   "name"
    t.date     "sales_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_info", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name", :limit => 256
  end

  create_table "users", :force => true do |t|
    t.string   "user_name"
    t.string   "user_pass"
    t.string   "user_mail"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "user_img"
  end

end
