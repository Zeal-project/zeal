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

ActiveRecord::Schema.define(version: 20160802152412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applies", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.string   "apply_status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["job_id"], name: "index_applies_on_job_id", using: :btree
    t.index ["user_id"], name: "index_applies_on_user_id", using: :btree
  end

  create_table "career_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_career_posts_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.string   "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "title"
    t.string   "intro"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_companies_on_user_id", using: :btree
  end

  create_table "cover_letters", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_cover_letters_on_job_id", using: :btree
    t.index ["user_id"], name: "index_cover_letters_on_user_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "job_desc"
    t.string   "seniority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
    t.index ["company_id"], name: "index_jobs_on_company_id", using: :btree
  end

  create_table "resumes", force: :cascade do |t|
    t.integer  "ideal_role"
    t.integer  "exp_in_role"
    t.integer  "length_of_working_exp"
    t.integer  "job_search_status"
    t.text     "reason_for_new_job"
    t.integer  "ideal_salary"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "resume_attachment_file_name"
    t.string   "resume_attachment_content_type"
    t.integer  "resume_attachment_file_size"
    t.datetime "resume_attachment_updated_at"
  end

  create_table "user_fav_career_posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "career_post_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["career_post_id"], name: "index_user_fav_career_posts_on_career_post_id", using: :btree
    t.index ["user_id"], name: "index_user_fav_career_posts_on_user_id", using: :btree
  end

  create_table "user_fav_companies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_user_fav_companies_on_company_id", using: :btree
    t.index ["user_id"], name: "index_user_fav_companies_on_user_id", using: :btree
  end

  create_table "user_fav_jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fb_token"
    t.string   "fb_uid"
    t.string   "tel"
    t.string   "name"
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["fb_uid"], name: "index_users_on_fb_uid", using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
