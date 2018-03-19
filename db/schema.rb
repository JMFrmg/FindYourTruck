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

ActiveRecord::Schema.define(version: 20180319093230) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "postalcode"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admins_on_username", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.string "name", default: "Ma commande"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "carts_dishes", id: false, force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "dish_id", null: false
    t.index ["cart_id", "dish_id"], name: "index_carts_dishes_on_cart_id_and_dish_id"
    t.index ["dish_id", "cart_id"], name: "index_carts_dishes_on_dish_id_and_cart_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.integer "menu_id"
    t.string "name"
    t.string "composition"
    t.float "price"
    t.index ["menu_id"], name: "index_dishes_on_menu_id"
  end

  create_table "foodtruckers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "postalcode"
    t.index ["email"], name: "index_foodtruckers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_foodtruckers_on_reset_password_token", unique: true
  end

  create_table "foodtruckers_users", id: false, force: :cascade do |t|
    t.integer "foodtrucker_id", null: false
    t.integer "user_id", null: false
    t.index ["foodtrucker_id", "user_id"], name: "index_foodtruckers_users_on_foodtrucker_id_and_user_id"
    t.index ["user_id", "foodtrucker_id"], name: "index_foodtruckers_users_on_user_id_and_foodtrucker_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer "foodtrucker_id"
    t.text "description"
    t.string "image"
    t.index ["foodtrucker_id"], name: "index_menus_on_foodtrucker_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "link"
    t.integer "foodtrucker_id"
    t.index ["foodtrucker_id"], name: "index_pictures_on_foodtrucker_id"
  end

  create_table "streets", force: :cascade do |t|
    t.string "address"
    t.integer "postalcode"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.boolean "actual", default: false
    t.integer "foodtrucker_id"
    t.index ["foodtrucker_id"], name: "index_streets_on_foodtrucker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "postalcode"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
