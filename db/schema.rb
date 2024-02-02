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

ActiveRecord::Schema[7.1].define(version: 2024_01_08_014534) do
  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.text "description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts_family_members", id: false, force: :cascade do |t|
    t.integer "family_member_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "family_member_id"], name: "idx_on_contact_id_family_member_id_e11ac54080"
    t.index ["family_member_id", "contact_id"], name: "idx_on_family_member_id_contact_id_7d3e22f1c7"
  end

  create_table "family_members", force: :cascade do |t|
    t.string "first_name"
    t.string "relationship"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_family_members_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.text "description"
    t.integer "quantity", default: 1
    t.string "link"
    t.boolean "purchased", default: false
    t.integer "family_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_member_id"], name: "index_wishlists_on_family_member_id"
  end

  add_foreign_key "family_members", "users"
  add_foreign_key "wishlists", "family_members"
end
