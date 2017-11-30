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

ActiveRecord::Schema.define(version: 20171130225837) do

  create_table "corporation_investments", force: :cascade do |t|
    t.integer "currency_id"
    t.integer "corporation_id"
    t.float "return_rate"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "corporations", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "regions_array"
    t.integer "investment_period"
    t.string "title"
    t.index ["confirmation_token"], name: "index_corporations_on_confirmation_token", unique: true
    t.index ["email"], name: "index_corporations_on_email", unique: true
    t.index ["reset_password_token"], name: "index_corporations_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_corporations_on_uid_and_provider", unique: true
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.float "rate"
    t.string "region"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currency_corporations", force: :cascade do |t|
    t.integer "currency_id"
    t.integer "corporation_id"
    t.float "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currency_investors", force: :cascade do |t|
    t.integer "currency_id"
    t.integer "investor_id"
    t.float "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investors", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_investors_on_confirmation_token", unique: true
    t.index ["email"], name: "index_investors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_investors_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_investors_on_uid_and_provider", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "corporation_id"
    t.integer "investor_id"
    t.integer "currency_id"
    t.float "total_amount"
    t.float "dolar_rate"
    t.float "return_rate"
    t.integer "t_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
