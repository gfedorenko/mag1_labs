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

ActiveRecord::Schema.define(version: 20200413184849) do

  create_table "cells", force: :cascade do |t|
    t.integer  "field_id"
    t.integer  "row_id"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_cells_on_field_id"
    t.index ["row_id"], name: "index_cells_on_row_id"
  end

  create_table "databases", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.integer  "header_id"
    t.string   "name"
    t.string   "field_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["header_id"], name: "index_fields_on_header_id"
  end

  create_table "headers", force: :cascade do |t|
    t.integer  "table_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_id"], name: "index_headers_on_table_id"
  end

  create_table "rows", force: :cascade do |t|
    t.integer  "table_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_id"], name: "index_rows_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string   "name"
    t.integer  "database_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["database_id"], name: "index_tables_on_database_id"
  end

end
