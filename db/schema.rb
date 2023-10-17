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

ActiveRecord::Schema[7.0].define(version: 2023_10_17_165018) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigncomments", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "campaign_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaigncomments_on_campaign_id"
    t.index ["user_id"], name: "index_campaigncomments_on_user_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "title", null: false
    t.float "estimated_duration", null: false
    t.bigint "expert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expert_id"], name: "index_campaigns_on_expert_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.bigint "todo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_comments_on_todo_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "campaign_id"
    t.bigint "expert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_tags_on_campaign_id"
    t.index ["expert_id"], name: "index_tags_on_expert_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "content", null: false
    t.boolean "done", default: false
    t.bigint "campaign_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_todos_on_campaign_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", default: "Novice"
    t.string "username", null: false
    t.string "status", null: false
    t.string "profession"
    t.string "service"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigncomments", "campaigns"
  add_foreign_key "campaigncomments", "users"
  add_foreign_key "comments", "todos"
  add_foreign_key "comments", "users"
end
