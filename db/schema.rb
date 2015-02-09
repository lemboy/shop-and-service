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

ActiveRecord::Schema.define(version: 20150209080523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer  "product_count", default: 1
    t.integer  "product_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "carts", ["product_id"], name: "index_carts_on_product_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "print_name"
    t.string   "contact_person"
    t.string   "contact_phone"
    t.integer  "lft"
    t.integer  "rgt"
    t.boolean  "is_leaf",        default: true
    t.integer  "group_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "measure"
    t.boolean  "is_service",                              default: false
    t.decimal  "purchase_price", precision: 16, scale: 2, default: 0.0
    t.decimal  "cash_price",     precision: 16, scale: 2, default: 0.0
    t.decimal  "noncash_price",  precision: 16, scale: 2, default: 0.0
    t.integer  "lft"
    t.integer  "rgt"
    t.boolean  "is_leaf",                                 default: true
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "group_id"
  end

  add_foreign_key "carts", "products"
end
