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

ActiveRecord::Schema.define(version: 2020_03_30_085222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movie_screens", force: :cascade do |t|
    t.bigint "screen_id", null: false
    t.bigint "movie_id", null: false
    t.bigint "slot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_time"
    t.index ["movie_id"], name: "index_movie_screens_on_movie_id"
    t.index ["screen_id"], name: "index_movie_screens_on_screen_id"
    t.index ["slot_id"], name: "index_movie_screens_on_slot_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "duration"
    t.date "release_date"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "language"
  end

  create_table "reservation_seats", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "seat_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reservation_id"], name: "index_reservation_seats_on_reservation_id"
    t.index ["seat_id"], name: "index_reservation_seats_on_seat_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "paid"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "movie_screen_id", null: false
    t.integer "price"
    t.index ["movie_screen_id"], name: "index_reservations_on_movie_screen_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "screens", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seats", force: :cascade do |t|
    t.string "row", limit: 5
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price"
    t.bigint "movie_screen_id", null: false
    t.index ["movie_screen_id"], name: "index_seats_on_movie_screen_id"
  end

  create_table "slots", force: :cascade do |t|
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "movie_screens", "movies"
  add_foreign_key "movie_screens", "screens"
  add_foreign_key "movie_screens", "slots"
  add_foreign_key "reservation_seats", "reservations"
  add_foreign_key "reservation_seats", "seats"
  add_foreign_key "reservations", "movie_screens"
  add_foreign_key "reservations", "users"
  add_foreign_key "seats", "movie_screens"
end
