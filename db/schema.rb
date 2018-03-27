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

ActiveRecord::Schema.define(version: 20180326061911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "body_states", force: :cascade do |t|
    t.bigint "run_record_id"
    t.integer "heart_rate"
    t.decimal "day_weight"
    t.decimal "day_body_fat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["run_record_id"], name: "index_body_states_on_run_record_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "board_id"
    t.integer "user_id", null: false
    t.string "user_name", default: "", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_comments_on_board_id"
  end

  create_table "competition_evaluations", force: :cascade do |t|
    t.bigint "run_record_id"
    t.integer "competition_point", default: 0, null: false
    t.text "competition_evaluation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["run_record_id"], name: "index_competition_evaluations_on_run_record_id"
  end

  create_table "competition_infos", force: :cascade do |t|
    t.date "competition_day", null: false
    t.string "competition_name", default: "", null: false
    t.string "competition_place", default: "", null: false
    t.string "competition_site", default: ""
    t.integer "competition_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competition_places", force: :cascade do |t|
    t.bigint "run_record_id"
    t.string "competition_place_address", default: "", null: false
    t.float "competition_place_latitude", null: false
    t.float "competition_place_longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["run_record_id"], name: "index_competition_places_on_run_record_id"
  end

  create_table "run_experiences", force: :cascade do |t|
    t.integer "run_level"
    t.integer "need_experience_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "run_records", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "run_class", null: false
    t.date "run_record_day", null: false
    t.decimal "run_distance", null: false
    t.integer "run_hour"
    t.integer "run_minute", null: false
    t.integer "run_second", null: false
    t.integer "run_calc_time", null: false
    t.text "run_content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_run_records_on_user_id"
  end

  create_table "user_comp_schedules", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "competition_info_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_info_id"], name: "index_user_comp_schedules_on_competition_info_id"
    t.index ["user_id", "competition_info_id"], name: "index_user_comp_schedules_on_user_id_and_competition_info_id", unique: true
    t.index ["user_id"], name: "index_user_comp_schedules_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "userid", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "image_url"
    t.string "name"
    t.string "avatar"
    t.string "avatar_cache"
    t.integer "total_run_experience", default: 0, null: false
    t.integer "run_level", default: 0, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["userid", "provider"], name: "index_users_on_userid_and_provider", unique: true
  end

  create_table "weather_conditions", force: :cascade do |t|
    t.bigint "run_record_id"
    t.string "day_weather"
    t.decimal "day_temperature"
    t.decimal "day_humidity"
    t.decimal "day_wind_speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["run_record_id"], name: "index_weather_conditions_on_run_record_id"
  end

  add_foreign_key "body_states", "run_records"
  add_foreign_key "comments", "boards"
  add_foreign_key "competition_evaluations", "run_records"
  add_foreign_key "competition_places", "run_records"
  add_foreign_key "run_records", "users"
  add_foreign_key "user_comp_schedules", "competition_infos"
  add_foreign_key "user_comp_schedules", "users"
  add_foreign_key "weather_conditions", "run_records"
end
