# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_221_103_112_257) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'opening_hours', force: :cascade do |t|
    t.bigint 'shop_id'
    t.integer 'day', null: false
    t.time 'opens_at', null: false
    t.time 'closes_at', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['shop_id'], name: 'index_opening_hours_on_shop_id'
  end

  create_table 'shops', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'opening_hours', 'shops'
end
