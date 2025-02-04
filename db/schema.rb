# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_01_27_165132) do
  create_table "blocked_dates", force: :cascade do |t|
    t.date "start_date"
    t.date "finish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rental_id"
    t.index ["rental_id"], name: "index_blocked_dates_on_rental_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.boolean "canceled", default: false
    t.integer "user_id"
    t.integer "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rentals_on_user_id"
    t.index ["vehicle_id"], name: "index_rentals_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "category", default: 0
    t.integer "transmission", default: 0
    t.integer "vehicle_type", default: 0
    t.decimal "cost", null: false
    t.integer "capacity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand", null: false
    t.string "model", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "blocked_dates", "rentals"
  add_foreign_key "vehicles", "users"
end
