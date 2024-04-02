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

ActiveRecord::Schema[7.1].define(version: 2024_04_02_065533) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "frnshr_items", force: :cascade do |t|
    t.string "name"
    t.string "furniture_type"
    t.integer "price"
    t.string "color"
    t.string "shop_name"
    t.string "shop_item_id"
    t.string "shop_url"
    t.string "x_dimension"
    t.string "y_dimension"
    t.string "z_dimension"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frnshr_planners", force: :cascade do |t|
    t.bigint "frnshr_room_id", null: false
    t.bigint "frnshr_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frnshr_item_id"], name: "index_frnshr_planners_on_frnshr_item_id"
    t.index ["frnshr_room_id"], name: "index_frnshr_planners_on_frnshr_room_id"
  end

  create_table "frnshr_rooms", force: :cascade do |t|
    t.text "palette", default: [], array: true
    t.string "room_type"
    t.string "name"
    t.bigint "frnshr_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frnshr_user_id"], name: "index_frnshr_rooms_on_frnshr_user_id"
  end

  create_table "frnshr_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_frnshr_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_frnshr_users_on_reset_password_token", unique: true
  end

  create_table "frnshr_wishlists", force: :cascade do |t|
    t.bigint "frnshr_room_id", null: false
    t.bigint "frnshr_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frnshr_item_id"], name: "index_frnshr_wishlists_on_frnshr_item_id"
    t.index ["frnshr_room_id"], name: "index_frnshr_wishlists_on_frnshr_room_id"
  end

  create_table "yml_bookmarks", force: :cascade do |t|
    t.text "comment"
    t.bigint "yml_movie_id", null: false
    t.bigint "yml_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["yml_list_id"], name: "index_yml_bookmarks_on_yml_list_id"
    t.index ["yml_movie_id"], name: "index_yml_bookmarks_on_yml_movie_id"
  end

  create_table "yml_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "yml_movies", force: :cascade do |t|
    t.string "title"
    t.text "overview"
    t.string "poster_url"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "frnshr_planners", "frnshr_items"
  add_foreign_key "frnshr_planners", "frnshr_rooms"
  add_foreign_key "frnshr_rooms", "frnshr_users"
  add_foreign_key "frnshr_wishlists", "frnshr_items"
  add_foreign_key "frnshr_wishlists", "frnshr_rooms"
  add_foreign_key "yml_bookmarks", "yml_lists"
  add_foreign_key "yml_bookmarks", "yml_movies"
end
