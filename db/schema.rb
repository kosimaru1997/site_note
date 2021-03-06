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

ActiveRecord::Schema.define(version: 2021_08_18_125900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "site_tags", force: :cascade do |t|
    t.bigint "site_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_site_tags_on_site_id"
    t.index ["tag_id"], name: "index_site_tags_on_tag_id"
  end

  create_table "sites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "url", null: false
    t.string "title", default: "No Title"
    t.text "description", default: "No Description"
    t.text "image"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["description"], name: "index_sites_on_description"
    t.index ["note"], name: "index_sites_on_note"
    t.index ["title"], name: "index_sites_on_title"
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "site_tags", "sites"
  add_foreign_key "site_tags", "tags"
  add_foreign_key "sites", "users"
end
