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

ActiveRecord::Schema.define(version: 2020_10_04_195827) do

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

  create_table "bills", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.integer "kg"
    t.string "fruit"
    t.float "ppfruit"
    t.float "tprice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_bills_on_order_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "zone"
    t.text "description"
    t.integer "rating"
    t.bigint "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["employee_id"], name: "index_clients_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.float "credit"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "landlords", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "description"
    t.integer "fields"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "names", force: :cascade do |t|
    t.string "phone"
    t.string "address"
    t.string "zone"
    t.text "description"
    t.bigint "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_names_on_employee_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.datetime "date"
    t.float "price"
    t.string "comment"
    t.boolean "delivered"
    t.boolean "paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "pickups", force: :cascade do |t|
    t.bigint "landlord_id", null: false
    t.date "date"
    t.integer "kgs"
    t.float "cost"
    t.float "addcost"
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

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.integer "kg"
    t.string "fruit"
    t.float "ppfruit"
    t.float "tprice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_tickets_on_order_id"
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
  add_foreign_key "bills", "orders"
  add_foreign_key "clients", "employees"
  add_foreign_key "names", "employees"
  add_foreign_key "orders", "clients"
  add_foreign_key "pickups", "landlords"
  add_foreign_key "receipts", "orders"
  add_foreign_key "tickets", "orders"
end
