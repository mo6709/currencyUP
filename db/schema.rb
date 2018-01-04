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

ActiveRecord::Schema.define(version: 20180104160853) do

  create_table "corporation_investments", force: :cascade do |t|
    t.integer "currency_id"
    t.integer "corporation_id"
    t.float "return_rate"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "investment_date"
  end

  create_table "corporations", force: :cascade do |t|
    t.string "regions_array"
    t.integer "investment_period"
    t.string "name"
    t.string "title"
    t.string "uid", default: "", null: false
    t.string "image"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.float "rate"
    t.string "region"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "acronym"
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
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "region"
    t.string "uid", default: "", null: false
    t.string "image"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "corporation_investments_id"
  end

end
