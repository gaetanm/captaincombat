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

ActiveRecord::Schema.define(version: 2018_11_12_140948) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "attack", default: 0
    t.integer "health", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weapon_id"
    t.integer "shield_id"
    t.integer "defense", default: 0
    t.integer "experience", default: 0
    t.index ["shield_id"], name: "index_fighters_on_shield_id"
    t.index ["weapon_id"], name: "index_fighters_on_weapon_id"
  end

  create_table "fights", force: :cascade do |t|
    t.integer "winner_id"
    t.integer "loser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loser_id"], name: "index_fights_on_loser_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
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

  create_table "turns", force: :cascade do |t|
    t.integer "fight_id"
    t.integer "initiator_id"
    t.integer "target_id"
    t.integer "action"
    t.string "initiator_weapon_used"
    t.string "target_shield_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "initiator_total_attack"
    t.integer "target_total_defense"
    t.integer "target_health_before_attack"
    t.boolean "critical_attack", default: false
    t.index ["fight_id"], name: "index_turns_on_fight_id"
    t.index ["initiator_id"], name: "index_turns_on_initiator_id"
    t.index ["target_id"], name: "index_turns_on_target_id"
  end

end
