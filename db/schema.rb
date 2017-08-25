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

ActiveRecord::Schema.define(version: 20170807171105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "cart_lines", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "movie_id"
    t.string   "movie_name"
    t.string   "movie_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.float    "movie_price"
    t.index ["cart_id"], name: "index_cart_lines_on_cart_id", using: :btree
    t.index ["movie_id"], name: "index_cart_lines_on_movie_id", using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "price"
    t.string   "trailer"
  end

  create_table "rents", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "active",     default: false
    t.integer  "movies"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_rents_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "full_name"
    t.boolean  "active_rent"
    t.integer  "cart_id"
    t.boolean  "admin",                  default: false
    t.index ["cart_id"], name: "index_users_on_cart_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cart_lines", "carts"
  add_foreign_key "cart_lines", "movies"
  add_foreign_key "carts", "users"
  add_foreign_key "rents", "users"
  add_foreign_key "users", "carts"
end
