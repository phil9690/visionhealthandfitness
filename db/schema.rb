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

ActiveRecord::Schema.define(version: 20180508215457) do

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email"
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.boolean "consent_to_market", default: false
    t.datetime "consent_to_market_date"
    t.string "consent_to_market_ip"
    t.string "consent_to_market_token"
    t.string "consent_to_market_ip_address"
    t.string "member_type"
    t.boolean "active"
    t.boolean "email_sent", default: false
    t.boolean "text_message_1_sent", default: false
    t.boolean "text_message_2_sent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "membership_options", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "card_token"
    t.integer "membership_option_id"
    t.string "title"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "post_code"
    t.date "dob"
    t.boolean "terms_accepted"
    t.index ["membership_option_id"], name: "index_memberships_on_membership_option_id"
  end

  create_table "trials", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["email"], name: "index_trials_on_email", unique: true
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "memberships", "membership_options"
end
