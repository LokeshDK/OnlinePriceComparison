# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_16_172143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branchinfos", force: :cascade do |t|
    t.string "branchname"
    t.string "address"
    t.integer "phoneno"
    t.string "branchincharge"
    t.integer "contactno"
    t.integer "storeinfo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["storeinfo_id"], name: "index_branchinfos_on_storeinfo_id"
    t.index ["user_id"], name: "index_branchinfos_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "categoryname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "productinfos", force: :cascade do |t|
    t.string "productname"
    t.string "storeproductid"
    t.decimal "productprice"
    t.integer "branchinfo_id", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["branchinfo_id"], name: "index_productinfos_on_branchinfo_id"
    t.index ["user_id"], name: "index_productinfos_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "title"
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.integer "phoneno"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "storeinfos", force: :cascade do |t|
    t.string "storename"
    t.string "address"
    t.integer "phoneno"
    t.string "buisnessid"
    t.integer "branchcount"
    t.string "storeincharge"
    t.integer "contactno"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_storeinfos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "branchinfos", "storeinfos"
  add_foreign_key "branchinfos", "users"
  add_foreign_key "productinfos", "branchinfos"
  add_foreign_key "productinfos", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "storeinfos", "users"
end
