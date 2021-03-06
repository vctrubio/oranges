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

ActiveRecord::Schema.define(version: 2020_11_01_155632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bags", force: :cascade do |t|
    t.integer "quantity"
    t.integer "price"
    t.bigint "pickup_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fruit"
    t.index ["pickup_id"], name: "index_bags_on_pickup_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "zone"
    t.text "description"
    t.integer "rating", default: 0
    t.bigint "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "flat"
    t.index ["employee_id"], name: "index_clients_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.float "credit", default: 0.0
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "inactive", default: false
  end

  create_table "landlords", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "description"
    t.integer "fields", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.date "date"
    t.float "price", default: 0.0
    t.string "comment"
    t.boolean "delivered"
    t.boolean "paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "time"
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "employee_id"
    t.date "date"
    t.string "title"
    t.float "price"
    t.boolean "ticket"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_payments_on_employee_id"
  end

  create_table "pickups", force: :cascade do |t|
    t.bigint "landlord_id", null: false
    t.date "date"
    t.integer "kgs"
    t.float "cost", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "comment"
    t.index ["landlord_id"], name: "index_pickups_on_landlord_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "kilos"
    t.string "fruit"
    t.float "ppfruit"
    t.float "tprice"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_receipts_on_order_id"
  end

  create_table "sacks", force: :cascade do |t|
    t.bigint "pickup_id", null: false
    t.integer "quantity"
    t.float "price"
    t.string "fruit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pickup_id"], name: "index_sacks_on_pickup_id"
  end

  create_table "totals", force: :cascade do |t|
    t.bigint "payment_id"
    t.bigint "order_id"
    t.bigint "pickup_id"
    t.float "inflow"
    t.float "outflow"
    t.float "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_totals_on_order_id"
    t.index ["payment_id"], name: "index_totals_on_payment_id"
    t.index ["pickup_id"], name: "index_totals_on_pickup_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bags", "pickups"
  add_foreign_key "clients", "employees"
  add_foreign_key "orders", "clients"
  add_foreign_key "payments", "employees"
  add_foreign_key "pickups", "landlords"
  add_foreign_key "receipts", "orders"
  add_foreign_key "sacks", "pickups"
  add_foreign_key "totals", "orders"
  add_foreign_key "totals", "payments"
  add_foreign_key "totals", "pickups"
end
