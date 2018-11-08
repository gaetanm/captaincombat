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

ActiveRecord::Schema.define(version: 2018_11_08_130321) do

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "attack", default: 0
    t.integer "health", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weapon_id"
    t.integer "shield_id"
    t.index ["shield_id"], name: "index_fighters_on_shield_id"
    t.index ["weapon_id"], name: "index_fighters_on_weapon_id"
  end

  create_table "stuffs", force: :cascade do |t|
    t.string "name"
    t.string "type", null: false
    t.integer "attack", default: 0
    t.integer "defense", default: 0
    t.integer "weight", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
