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

ActiveRecord::Schema.define(version: 20161202114630) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "rangoMin"
    t.integer  "rangoMax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "borrado"
  end

  create_table "answers", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "comment_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "buys", force: :cascade do |t|
    t.bigint   "tarjeta"
    t.integer  "puntos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "publication_id"
  end

  create_table "ofrecimientos", force: :cascade do |t|
    t.datetime "fecha"
    t.string   "descripcion"
    t.boolean  "aceptado"
    t.integer  "user_id"
    t.integer  "publication_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.string   "ciudad"
    t.string   "foto"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.boolean  "calificacion",                   null: false
    t.string   "descripcion"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.integer  "publication_id"
    t.boolean  "calificado",     default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "nombre"
    t.string   "apellido"
    t.bigint   "telefono"
    t.date     "fecha"
    t.boolean  "admin",                  default: false
    t.integer  "puntos",                 default: 1
    t.integer  "achievement_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
