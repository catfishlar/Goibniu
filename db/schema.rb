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

ActiveRecord::Schema.define(version: 20141207232938) do

  create_table "databases", force: true do |t|
    t.string   "name"
    t.string   "host"
    t.string   "dbschema"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "db_statuses", force: true do |t|
    t.integer  "database_id"
    t.date     "request_date"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schema_fields", force: true do |t|
    t.integer  "schema_table_id"
    t.string   "name"
    t.boolean  "nullable"
    t.string   "default"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_params"
    t.string   "field_type"
  end

  create_table "schema_key_fields", force: true do |t|
    t.integer  "schema_key_id"
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schema_keys", force: true do |t|
    t.integer  "schema_table_id"
    t.string   "name"
    t.boolean  "primary"
    t.boolean  "unique"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schema_tables", force: true do |t|
    t.integer  "schema_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "schema_versions", force: true do |t|
    t.integer  "schema_id"
    t.string   "version"
    t.string   "mysql_dump"
    t.string   "mysql_distrib"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schemas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_statuses", force: true do |t|
    t.integer  "db_status_id"
    t.string   "name"
    t.string   "engine"
    t.string   "version"
    t.string   "row_format"
    t.integer  "rows"
    t.integer  "avg_row_length"
    t.integer  "data_length"
    t.integer  "max_data_length"
    t.integer  "index_length"
    t.integer  "data_free"
    t.string   "auto_increment"
    t.datetime "create_time"
    t.datetime "update_time"
    t.datetime "check_time"
    t.string   "collation"
    t.string   "checksum"
    t.string   "create_options"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
