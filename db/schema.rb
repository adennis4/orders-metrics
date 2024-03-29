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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121016220101) do

  create_table "bookings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "status"
    t.datetime "check_in"
    t.datetime "check_out"
    t.integer  "number_of_adults"
    t.integer  "number_of_children"
    t.integer  "number_of_rooms"
    t.string   "ip_address",         :limit => 20
    t.string   "destination"
    t.integer  "location_id"
    t.integer  "fips_county_code"
  end

  add_index "bookings", ["fips_county_code"], :name => "index_bookings_on_fips_county_code"

  create_table "locations", :force => true do |t|
    t.string   "county"
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "fips_county_code"
  end

  add_index "locations", ["fips_county_code"], :name => "index_locations_on_fips_county_code"

end
