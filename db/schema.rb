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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140226162626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "phone_number"
    t.string   "mobile_phone_number"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website_url"
    t.string   "email"
    t.string   "district"
  end

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "name"
    t.string   "last_name"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  add_index "admin_users", ["unlock_token"], name: "index_admin_users_on_unlock_token", unique: true, using: :btree

  create_table "ads", force: true do |t|
    t.integer  "page_id"
    t.string   "name"
    t.integer  "category_id"
    t.integer  "doctor_id"
    t.integer  "clinic_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.boolean  "published",          default: false
    t.integer  "sort_order",         default: 0
    t.datetime "date_start"
    t.datetime "date_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "baseurl"
  end

  add_index "ads", ["category_id"], name: "index_ads_on_category_id", using: :btree
  add_index "ads", ["clinic_id"], name: "index_ads_on_clinic_id", using: :btree
  add_index "ads", ["date_end"], name: "ads_date_end_index", using: :btree
  add_index "ads", ["date_start"], name: "ads_date_start_index", using: :btree
  add_index "ads", ["doctor_id"], name: "index_ads_on_doctor_id", using: :btree
  add_index "ads", ["page_id"], name: "index_ads_on_page_id", using: :btree

  create_table "advises", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "last_name"
    t.string   "name"
    t.string   "full_name"
    t.string   "specialty"
    t.string   "city"
    t.string   "phone_number"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pediatric",    default: false
    t.boolean  "processed",    default: false
    t.boolean  "email_sent",   default: false
    t.boolean  "idoctor",      default: false
    t.boolean  "iclinic",      default: false
    t.text     "comment"
    t.integer  "rating",       default: 0
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.boolean  "pediatric",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clinics_count", default: 0
    t.integer  "doctors_count", default: 0
  end

  create_table "clinic_category_relations", force: true do |t|
    t.integer  "category_id"
    t.integer  "clinic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clinic_category_relations", ["category_id"], name: "clinic_category_id_index", using: :btree
  add_index "clinic_category_relations", ["clinic_id"], name: "clinic_clinic_id_index", using: :btree

  create_table "clinics", force: true do |t|
    t.text     "description"
    t.string   "status"
    t.integer  "user_id"
    t.boolean  "published",                              default: true
    t.integer  "comments_count",                         default: 0
    t.float    "rating",                                 default: 0.0
    t.integer  "likes_count",                            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
    t.date     "starting_work"
    t.string   "awards"
    t.decimal  "price",          precision: 8, scale: 2, default: 0.0
    t.string   "specialty"
    t.boolean  "pediatric",                              default: false
    t.integer  "advise_id"
    t.boolean  "visit_home",                             default: false
    t.integer  "photos_count",                           default: 0
    t.date     "end_promo"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.integer  "rating",           default: 0
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",        default: true
    t.string   "name"
  end

  create_table "contents", force: true do |t|
    t.string   "name"
    t.string   "announce"
    t.text     "body"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["page_id"], name: "index_contents_on_page_id", using: :btree

  create_table "doctor_category_relations", force: true do |t|
    t.integer  "doctor_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "doctor_category_relations", ["category_id"], name: "index_doctor_category_relations_on_category_id", using: :btree
  add_index "doctor_category_relations", ["doctor_id"], name: "index_doctor_category_relations_on_doctor_id", using: :btree

  create_table "doctors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "clinic_id"
    t.boolean  "published",                                    default: true
    t.integer  "comments_count",                               default: 0
    t.float    "rating",                                       default: 0.0
    t.integer  "likes_count",                                  default: 0
    t.string   "education"
    t.date     "starting_work"
    t.date     "high_school_finished"
    t.string   "high_school_name"
    t.string   "awards"
    t.decimal  "price",                precision: 8, scale: 2
    t.string   "specialty"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.boolean  "pediatric",                                    default: false
    t.integer  "advise_id"
    t.boolean  "visit_home",                                   default: false
    t.integer  "photos_count",                                 default: 0
    t.string   "employer"
    t.date     "end_promo"
  end

  add_index "doctors", ["clinic_id"], name: "index_doctors_on_clinic_id", using: :btree
  add_index "doctors", ["user_id"], name: "index_doctors_on_user_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.boolean  "published"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.text     "description"
    t.string   "type"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "social_url"
    t.string   "picture_url"
    t.string   "gender"
    t.string   "birthday"
    t.string   "locale"
    t.string   "location"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
