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

ActiveRecord::Schema[7.0].define(version: 2022_08_19_110620) do
  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "property_city"
    t.string "property_address"
    t.integer "property_type"
    t.float "property_exclusive_area"
    t.float "property_land_area"
    t.float "property_building_area_float"
    t.integer "property_building_area_unit"
    t.float "property_floor_area"
    t.string "url_param"
    t.integer "property_room_plan"
    t.integer "property_constructed_year"
    t.string "user_email"
    t.string "user_name"
    t.string "user_name_kana"
    t.string "user_tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
