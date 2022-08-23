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

ActiveRecord::Schema[7.0].define(version: 2022_08_23_020603) do
  create_table "assessable_areas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_assessable_areas_on_branch_id"
    t.index ["city_id"], name: "index_assessable_areas_on_city_id"
  end

  create_table "branch_property_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "property_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_branch_property_types_on_branch_id"
    t.index ["property_type_id"], name: "index_branch_property_types_on_property_type_id"
  end

  create_table "branches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.integer "ieul_branch_id", null: false
    t.string "logo_url", null: false
    t.string "post_code"
    t.bigint "city_id", null: false
    t.string "other_address", null: false
    t.string "phone_number"
    t.string "fax_number"
    t.string "open_hours"
    t.string "regular_holiday"
    t.text "catch_copy", null: false
    t.text "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_branches_on_city_id"
    t.index ["company_id"], name: "index_branches_on_company_id"
    t.index ["ieul_branch_id"], name: "index_branches_on_ieul_branch_id", unique: true
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "prefecture_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "ieul_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ieul_company_id"], name: "index_companies_on_ieul_company_id", unique: true
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_prefectures_on_name", unique: true
  end

  create_table "property_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_property_types_on_name", unique: true
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.bigint "branch_id", null: false
    t.integer "age", null: false
    t.bigint "city_id", null: false
    t.string "property_address", null: false
    t.integer "response_satisfaction", default: 0, null: false
    t.integer "sale_number", default: 0, null: false
    t.integer "sale_reason", default: 0, null: false
    t.bigint "property_type_id", null: false
    t.date "sale_consideration_period", null: false
    t.date "assessment_request_period", null: false
    t.date "sale_period", null: false
    t.date "sale_time", null: false
    t.date "delivery_time", null: false
    t.integer "appraisal_price", null: false
    t.integer "sold_price", null: false
    t.integer "contract_price", null: false
    t.boolean "price_reduction_flag", null: false
    t.integer "price_reduction_time"
    t.integer "price_reduction"
    t.integer "form", default: 0, null: false
    t.string "heading", null: false
    t.text "sale_concerns", null: false
    t.text "company_selection_reason", null: false
    t.text "reasons_response_satisfaction", null: false
    t.text "advice", null: false
    t.text "improvement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_reviews_on_branch_id"
    t.index ["city_id"], name: "index_reviews_on_city_id"
    t.index ["property_type_id"], name: "index_reviews_on_property_type_id"
  end

  add_foreign_key "assessable_areas", "branches"
  add_foreign_key "assessable_areas", "cities"
  add_foreign_key "branch_property_types", "branches"
  add_foreign_key "branch_property_types", "property_types"
  add_foreign_key "branches", "cities"
  add_foreign_key "branches", "companies"
  add_foreign_key "cities", "prefectures"
  add_foreign_key "reviews", "branches"
  add_foreign_key "reviews", "cities"
  add_foreign_key "reviews", "property_types"
end
