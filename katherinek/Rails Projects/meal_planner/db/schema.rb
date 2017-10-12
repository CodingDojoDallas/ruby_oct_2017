# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171010201935) do

  create_table "ingredient_lists", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.integer  "amount"
  end

  add_index "ingredient_lists", ["ingredient_id"], name: "index_ingredient_lists_on_ingredient_id"
  add_index "ingredient_lists", ["recipe_id"], name: "index_ingredient_lists_on_recipe_id"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.integer  "qty"
    t.string   "unit"
    t.string   "source"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "cat"
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "mealtime"
    t.string   "desc"
    t.integer  "preptime"
    t.integer  "cooktime"
    t.text     "directions"
    t.text     "notes"
    t.string   "source"
    t.string   "holiday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "cuisine"
  end

end
