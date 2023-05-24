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

ActiveRecord::Schema[7.0].define(version: 2021_19_22_153730) do
  create_table "characteristics", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.boolean "archive"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_characteristics_on_user_id"
  end

  create_table "characteristics_parishioners", id: false, force: :cascade do |t|
    t.integer "characteristic_id", null: false
    t.integer "parishioner_id", null: false
    t.index ["characteristic_id", "parishioner_id"], name: "charpar"
    t.index ["parishioner_id", "characteristic_id"], name: "parchar"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.boolean "archive"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_features_on_user_id"
  end

  create_table "features_places", id: false, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "place_id", null: false
    t.index ["feature_id", "place_id"], name: "index_features_places_on_feature_id_and_place_id"
    t.index ["place_id", "feature_id"], name: "index_features_places_on_place_id_and_feature_id"
  end

  create_table "ministers", force: :cascade do |t|
    t.string "fullname"
    t.text "notes"
    t.boolean "archive"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ministers_on_user_id"
  end

  create_table "parishioners", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.date "birth"
    t.string "birth_place"
    t.integer "place_id", null: false
    t.boolean "death_mark"
    t.date "death_date"
    t.date "baptism_date"
    t.string "baptism_parish"
    t.string "baptism_number"
    t.string "confirmation_name"
    t.string "confirmation_witness"
    t.date "confirmation_date"
    t.string "confirmation_number"
    t.text "notes"
    t.boolean "archive"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "email"
    t.index ["place_id"], name: "index_parishioners_on_place_id"
    t.index ["user_id"], name: "index_parishioners_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.integer "street_id", null: false
    t.string "address"
    t.text "notes"
    t.boolean "archive"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["street_id"], name: "index_places_on_street_id"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "streets", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.boolean "archive"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_streets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.date "issue"
    t.integer "parishioner_id", null: false
    t.integer "minister_id", null: false
    t.boolean "eucharist"
    t.boolean "confession"
    t.boolean "anointing"
    t.text "notes"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["minister_id"], name: "index_visits_on_minister_id"
    t.index ["parishioner_id"], name: "index_visits_on_parishioner_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "characteristics", "users"
  add_foreign_key "features", "users"
  add_foreign_key "ministers", "users"
  add_foreign_key "parishioners", "places"
  add_foreign_key "parishioners", "users"
  add_foreign_key "places", "streets"
  add_foreign_key "places", "users"
  add_foreign_key "streets", "users"
  add_foreign_key "visits", "ministers"
  add_foreign_key "visits", "parishioners"
  add_foreign_key "visits", "users"
end
