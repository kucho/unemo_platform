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

ActiveRecord::Schema.define(version: 2021_01_06_224427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_income_sources", force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2, null: false
    t.bigint "income_source_id", null: false
    t.bigint "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_board_income_sources_on_board_id"
    t.index ["income_source_id"], name: "index_board_income_sources_on_income_source_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.bigint "user_group_id", null: false
    t.bigint "currency_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_boards_on_currency_id"
    t.index ["user_group_id"], name: "index_boards_on_user_group_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "label"
    t.integer "order"
    t.decimal "budget", precision: 8, scale: 2
    t.bigint "board_id", null: false
    t.bigint "parent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_categories_on_board_id"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.string "nomenclature", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "description"
    t.decimal "amount", precision: 8, scale: 2, null: false
    t.bigint "payee_id", null: false
    t.bigint "board_id", null: false
    t.bigint "category_id", null: false
    t.bigint "currency_id", null: false
    t.datetime "date", null: false
    t.boolean "pending", default: true
    t.decimal "exchange_rate", precision: 8, scale: 2, default: "1.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_expenses_on_board_id"
    t.index ["category_id"], name: "index_expenses_on_category_id"
    t.index ["currency_id"], name: "index_expenses_on_currency_id"
    t.index ["payee_id"], name: "index_expenses_on_payee_id"
  end

  create_table "income_sources", force: :cascade do |t|
    t.string "name"
    t.bigint "income_type_id", null: false
    t.bigint "user_id", null: false
    t.bigint "currency_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_income_sources_on_currency_id"
    t.index ["income_type_id"], name: "index_income_sources_on_income_type_id"
    t.index ["user_id"], name: "index_income_sources_on_user_id"
  end

  create_table "income_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2, null: false
    t.string "description"
    t.bigint "income_source_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["income_source_id"], name: "index_incomes_on_income_source_id"
  end

  create_table "payees", force: :cascade do |t|
    t.string "name"
    t.string "note"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_payees_on_user_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.string "name"
    t.bigint "creator_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id_id"], name: "index_user_groups_on_creator_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "time_zone", default: "Lima"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_group_id"
    t.index ["user_group_id"], name: "index_users_on_user_group_id"
  end

  add_foreign_key "board_income_sources", "boards"
  add_foreign_key "board_income_sources", "income_sources"
  add_foreign_key "boards", "currencies"
  add_foreign_key "boards", "user_groups"
  add_foreign_key "categories", "boards"
  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "expenses", "boards"
  add_foreign_key "expenses", "categories"
  add_foreign_key "expenses", "currencies"
  add_foreign_key "expenses", "payees"
  add_foreign_key "income_sources", "currencies"
  add_foreign_key "income_sources", "income_types"
  add_foreign_key "income_sources", "users"
  add_foreign_key "incomes", "income_sources"
  add_foreign_key "payees", "users"
  add_foreign_key "user_groups", "users", column: "creator_id_id"
  add_foreign_key "users", "user_groups"
end
