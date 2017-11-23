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

ActiveRecord::Schema.define(version: 20171123063011) do

  create_table "ragnarok_item_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "item_id", null: false
    t.integer "skill_id", null: false
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ragnarok_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.integer "rare", null: false
    t.integer "attack", default: 0, null: false
    t.integer "defense", default: 0, null: false
    t.integer "speed", default: 0, null: false
    t.integer "intelligence", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ragnarok_medallions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "short_name", null: false
    t.string "name", null: false
    t.integer "reality", null: false
    t.integer "resource", null: false
    t.integer "cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ragnarok_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ragnarok_title_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "title_id", null: false
    t.integer "skill_id", null: false
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ragnarok_titles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.boolean "prefix", default: false, null: false
    t.boolean "suffix", default: false, null: false
    t.integer "attack", default: 0, null: false
    t.integer "defense", default: 0, null: false
    t.integer "speed", default: 0, null: false
    t.integer "intelligence", default: 0, null: false
    t.string "specialty", default: "", null: false
    t.string "protection", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "medallion_id", null: false
  end

  create_table "ragnarok_units", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.string "protection", null: false
    t.string "profession", null: false
    t.integer "hp", null: false
    t.integer "attack", null: false
    t.integer "defense", null: false
    t.integer "speed", null: false
    t.integer "intelligence", null: false
    t.string "tribe", null: false
    t.string "specialty", null: false
    t.string "item1", null: false
    t.string "item2", null: false
    t.integer "rank", default: 1, null: false
    t.integer "cost", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
