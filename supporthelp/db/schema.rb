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

ActiveRecord::Schema.define(version: 20150606175713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "description"
    t.integer  "system_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories", ["system_id"], name: "index_categories_on_system_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "comments", ["ticket_id"], name: "index_comments_on_ticket_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "priorities", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "systems", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "system_id"
    t.integer  "category_id"
    t.integer  "status_id"
    t.integer  "priority_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "creator_id"
    t.integer  "incharge_id"
  end

  add_index "tickets", ["category_id"], name: "index_tickets_on_category_id", using: :btree
  add_index "tickets", ["creator_id"], name: "index_tickets_on_creator_id", using: :btree
  add_index "tickets", ["incharge_id"], name: "index_tickets_on_incharge_id", using: :btree
  add_index "tickets", ["priority_id"], name: "index_tickets_on_priority_id", using: :btree
  add_index "tickets", ["status_id"], name: "index_tickets_on_status_id", using: :btree
  add_index "tickets", ["system_id"], name: "index_tickets_on_system_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "ddd",                    default: "", null: false
    t.integer  "company_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "deleted_at"
    t.string   "phone"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "categories", "systems"
  add_foreign_key "comments", "tickets"
  add_foreign_key "tickets", "categories"
  add_foreign_key "tickets", "priorities"
  add_foreign_key "tickets", "statuses"
  add_foreign_key "tickets", "systems"
end
