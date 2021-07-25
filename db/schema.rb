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

ActiveRecord::Schema.define(version: 2021_07_22_081517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spell_books", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "spell_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_spell_books_on_book_id"
    t.index ["spell_id", "book_id"], name: "index_spell_books_on_spell_id_and_book_id", unique: true
    t.index ["spell_id"], name: "index_spell_books_on_spell_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.integer "level", default: 0, null: false
    t.string "school", limit: 30, null: false
    t.string "classes", default: [], null: false, array: true
    t.boolean "concentration", default: false, null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "spell_books", "books"
  add_foreign_key "spell_books", "spells"
end
