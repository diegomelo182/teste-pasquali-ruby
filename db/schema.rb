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

ActiveRecord::Schema.define(version: 2018_05_16_065813) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "name"
    t.date "init_date"
    t.float "balance"
    t.integer "kind"
    t.integer "status"
    t.integer "parent_account_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_account_id"], name: "index_accounts_on_parent_account_id"
    t.index ["person_id"], name: "index_accounts_on_person_id"
  end

  create_table "contributions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "amount"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_contributions_on_account_id"
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cpf_cnpj"
    t.text "business_name"
    t.text "name"
    t.date "bday"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transferences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "amount"
    t.bigint "account_id"
    t.bigint "receiver_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transferences_on_account_id"
    t.index ["receiver_account_id"], name: "fk_rails_8caad9fee0"
  end

  add_foreign_key "accounts", "people"
  add_foreign_key "contributions", "accounts"
  add_foreign_key "transferences", "accounts"
  add_foreign_key "transferences", "accounts", column: "receiver_account_id"
end
