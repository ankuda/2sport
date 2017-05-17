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

ActiveRecord::Schema.define(version: 20170516121409) do

  create_table "books", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "btype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "title"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "city_id"
    t.index ["city_id"], name: "index_countries_on_city_id"
  end

  create_table "covers", force: :cascade do |t|
    t.string   "ctype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "book_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
    t.index ["book_id"], name: "index_line_items_on_book_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "country_id"
    t.integer  "city_id"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_locations_on_city_id"
    t.index ["country_id"], name: "index_locations_on_country_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price"
    t.string   "working_hours"
    t.integer  "category_id"
    t.integer  "location_id"
    t.integer  "size_id"
    t.integer  "cover_id"
    t.integer  "building_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["building_id"], name: "index_products_on_building_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["cover_id"], name: "index_products_on_cover_id"
    t.index ["location_id"], name: "index_products_on_location_id"
    t.index ["size_id"], name: "index_products_on_size_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.integer  "width"
    t.integer  "height"
    t.integer  "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
