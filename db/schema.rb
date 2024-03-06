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

ActiveRecord::Schema[7.1].define(version: 2024_03_06_113118) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acquisitions", force: :cascade do |t|
    t.string "date_time"
    t.bigint "wig_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_acquisitions_on_user_id"
    t.index ["wig_id"], name: "index_acquisitions_on_wig_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "hexa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lengths", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "textures", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "username", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wigs", force: :cascade do |t|
    t.bigint "color_id", null: false
    t.bigint "texture_id", null: false
    t.bigint "size_id", null: false
    t.bigint "length_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_wigs_on_color_id"
    t.index ["length_id"], name: "index_wigs_on_length_id"
    t.index ["size_id"], name: "index_wigs_on_size_id"
    t.index ["texture_id"], name: "index_wigs_on_texture_id"
    t.index ["user_id"], name: "index_wigs_on_user_id"
  end

  add_foreign_key "acquisitions", "users"
  add_foreign_key "acquisitions", "wigs"
  add_foreign_key "wigs", "colors"
  add_foreign_key "wigs", "lengths"
  add_foreign_key "wigs", "sizes"
  add_foreign_key "wigs", "textures"
  add_foreign_key "wigs", "users"
end
