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

ActiveRecord::Schema[7.0].define(version: 2022_12_15_032409) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_pages", force: :cascade do |t|
    t.bigint "album_id", null: false
    t.integer "page_number", null: false
    t.string "background_image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_pages_on_album_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "name", null: false
    t.integer "code"
    t.text "description"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "album_id", null: false
    t.index ["album_id"], name: "index_albums_users_on_album_id"
    t.index ["user_id"], name: "index_albums_users_on_user_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_exchanges_on_receiver_id"
    t.index ["sender_id"], name: "index_exchanges_on_sender_id"
  end

  create_table "page_stickers", force: :cascade do |t|
    t.bigint "album_page_id", null: false
    t.bigint "sticker_id", null: false
    t.float "position_x"
    t.float "position_y"
    t.float "rotation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_page_id"], name: "index_page_stickers_on_album_page_id"
    t.index ["sticker_id"], name: "index_page_stickers_on_sticker_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "receiver_stickers", force: :cascade do |t|
    t.bigint "exchange_id", null: false
    t.bigint "sticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exchange_id"], name: "index_receiver_stickers_on_exchange_id"
    t.index ["sticker_id"], name: "index_receiver_stickers_on_sticker_id"
  end

  create_table "sender_stickers", force: :cascade do |t|
    t.bigint "exchange_id", null: false
    t.bigint "sticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exchange_id"], name: "index_sender_stickers_on_exchange_id"
    t.index ["sticker_id"], name: "index_sender_stickers_on_sticker_id"
  end

  create_table "stickers", force: :cascade do |t|
    t.string "code"
    t.text "description"
    t.string "picture"
    t.boolean "is_active", default: true
    t.bigint "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_stickers_on_album_id"
  end

  create_table "stickers_packs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "album_id"
    t.integer "quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_stickers_packs_on_album_id"
    t.index ["user_id"], name: "index_stickers_packs_on_user_id"
  end

  create_table "user_stickers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sticker_id", null: false
    t.integer "quantity"
    t.boolean "is_active", default: true
    t.boolean "is_favorite", default: false
    t.boolean "is_open_to_trade", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sticker_id"], name: "index_user_stickers_on_sticker_id"
    t.index ["user_id"], name: "index_user_stickers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "code", default: ""
    t.string "name", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "album_pages", "albums"
  add_foreign_key "exchanges", "users", column: "receiver_id"
  add_foreign_key "exchanges", "users", column: "sender_id"
  add_foreign_key "page_stickers", "album_pages"
  add_foreign_key "page_stickers", "stickers"
  add_foreign_key "permissions", "users"
  add_foreign_key "receiver_stickers", "exchanges"
  add_foreign_key "receiver_stickers", "stickers"
  add_foreign_key "sender_stickers", "exchanges"
  add_foreign_key "sender_stickers", "stickers"
  add_foreign_key "stickers", "albums"
  add_foreign_key "user_stickers", "stickers"
  add_foreign_key "user_stickers", "users"
end
