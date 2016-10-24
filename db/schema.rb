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

ActiveRecord::Schema.define(version: 20161019002519) do

  create_table "accesory_sales", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "lent_accesory_id"
    t.integer  "quantity"
    t.decimal  "price_sale",       precision: 8, scale: 2
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "second_surname"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "type_doc_id"
    t.string   "num_doc"
    t.string   "name"
    t.string   "last_name"
    t.string   "second_surname"
    t.integer  "age"
    t.integer  "sex"
    t.string   "address"
    t.string   "company_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "history_clients", force: :cascade do |t|
    t.integer  "client_id"
    t.date     "date_consult"
    t.string   "num_consult"
    t.string   "anamnesis"
    t.string   "past_eye_left"
    t.string   "past_eye_right"
    t.integer  "past_lent_type_id"
    t.string   "current_eye_left"
    t.string   "current_eye_right"
    t.integer  "current_lent_type_id"
    t.string   "add_near"
    t.string   "add_intermedium"
    t.string   "add_alt"
    t.string   "result_info"
    t.string   "recommend_info"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "info_sales", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "quantity"
    t.integer  "lent_serial_id"
    t.decimal  "price_sale",     precision: 8, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "lent_accesories", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price_cost", precision: 8, scale: 2
    t.decimal  "price_shop", precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "lent_colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lent_kinds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lent_marks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lent_models", force: :cascade do |t|
    t.string   "name"
    t.integer  "lent_mark_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "lent_serials", force: :cascade do |t|
    t.integer  "lent_kind_id"
    t.integer  "lent_model_id"
    t.integer  "lent_color_id"
    t.string   "name"
    t.decimal  "price_cost",    precision: 8, scale: 2
    t.decimal  "price_shop",    precision: 8, scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "lent_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monture_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "num_sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "num_doc"
    t.integer  "type_doc_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_docs", force: :cascade do |t|
    t.integer  "type_client_id"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "account_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
