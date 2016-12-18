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

ActiveRecord::Schema.define(version: 20161209172123) do

  create_table "abouts", force: :cascade do |t|
    t.string   "resume"
    t.string   "objective"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_abouts_on_user_id"
  end

  create_table "complementary_trainnings", force: :cascade do |t|
    t.string   "name_instituition_comp"
    t.string   "course_comp"
    t.integer  "workload"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_complementary_trainnings_on_user_id"
  end

  create_table "idioms", force: :cascade do |t|
    t.string   "language_idiom"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_idioms_on_user_id"
  end

  create_table "instituitions", force: :cascade do |t|
    t.string   "name_instituition"
    t.string   "graduation"
    t.string   "course"
    t.integer  "start_year_grad"
    t.integer  "exit_year_grad"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_instituitions_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "employer"
    t.string   "office"
    t.integer  "start_year_job"
    t.integer  "exit_year_job"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "personal_data", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "cnh"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personal_data_on_user_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string   "phone_user"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
