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

ActiveRecord::Schema.define(version: 2018_10_31_162719) do

  create_table "accounts", force: :cascade do |t|
    t.integer "client_id"
    t.integer "branch_id"
    t.string "ac_type"
    t.string "ac_number"
    t.string "ifsc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount"
    t.index ["branch_id"], name: "index_accounts_on_branch_id"
    t.index ["client_id"], name: "index_accounts_on_client_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
  end

  create_table "branches", force: :cascade do |t|
    t.integer "bank_id"
    t.string "address"
    t.string "ifsc"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_branches_on_bank_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "account_id"
    t.string "card_type"
    t.string "number"
    t.integer "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bank_id"
    t.float "limit"
    t.index ["account_id"], name: "index_cards_on_account_id"
    t.index ["bank_id"], name: "index_cards_on_bank_id"
  end

  create_table "clients", force: :cascade do |t|
    t.integer "branch_id"
    t.string "number"
    t.integer "age"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_clients_on_branch_id"
  end

  create_table "loans", force: :cascade do |t|
    t.integer "client_id"
    t.string "loan_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
    t.float "amount"
    t.index ["branch_id"], name: "index_loans_on_branch_id"
    t.index ["client_id"], name: "index_loans_on_client_id"
  end

  create_table "transections", force: :cascade do |t|
    t.integer "account_id"
    t.string "txn_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount"
    t.integer "card_id"
    t.index ["account_id"], name: "index_transections_on_account_id"
    t.index ["card_id"], name: "index_transections_on_card_id"
  end

end
