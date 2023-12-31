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

ActiveRecord::Schema[7.1].define(version: 2023_11_23_104146) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gyms", force: :cascade do |t|
    t.string "description"
    t.integer "price"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "average_rating"
    t.string "name"
    t.string "preview"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "lat"
    t.string "lng"
    t.string "address"
    t.index ["user_id"], name: "index_gyms_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "gym_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
    t.index ["gym_id"], name: "index_memberships_on_gym_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "gym_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rating"
    t.index ["gym_id"], name: "index_reviews_on_gym_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "gyms", "users"
  add_foreign_key "memberships", "gyms"
  add_foreign_key "memberships", "users"
  add_foreign_key "reviews", "gyms"
  add_foreign_key "reviews", "users"
end
