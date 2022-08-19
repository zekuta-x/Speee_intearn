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

ActiveRecord::Schema[7.0].define(version: 2022_08_19_052345) do
  create_table "assessable_areas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "municipality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipality_id"], name: "index_assessable_areas_on_municipality_id"
    t.index ["store_id"], name: "index_assessable_areas_on_store_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "ieul_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipalities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "prefecture_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_municipalities_on_prefecture_id"
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.integer "ieul_store_id"
    t.string "logo_url"
    t.string "post_code"
    t.bigint "municipality_id", null: false
    t.string "property_address"
    t.string "phone_number"
    t.string "fax_number"
    t.string "open_hours"
    t.string "holiday"
    t.text "catch_copy"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_stores_on_company_id"
    t.index ["municipality_id"], name: "index_stores_on_municipality_id"
  end

  create_table "target_property_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "property_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_type_id"], name: "index_target_property_types_on_property_type_id"
    t.index ["store_id"], name: "index_target_property_types_on_store_id"
  end

  add_foreign_key "assessable_areas", "municipalities"
  add_foreign_key "assessable_areas", "stores"
  add_foreign_key "municipalities", "prefectures"
  add_foreign_key "stores", "companies"
  add_foreign_key "stores", "municipalities"
  add_foreign_key "target_property_types", "property_types"
  add_foreign_key "target_property_types", "stores"
end
