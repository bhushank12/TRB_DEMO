# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_907_034_329) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'calls', force: :cascade do |t|
    t.bigint 'customer_id', null: false
    t.string 'vmake'
    t.string 'vmodel'
    t.string 'vsubmodel'
    t.string 'vcategory'
    t.string 'vsubcategory'
    t.date 'registration_date'
    t.date 'policy_expiry'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id', null: false
    t.string 'vehicle_type'
    t.index ['customer_id'], name: 'index_calls_on_customer_id'
    t.index ['user_id'], name: 'index_calls_on_user_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'title'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'customer_name'
    t.string 'gender'
    t.date 'birth_date'
    t.string 'mobile_number'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'calls', 'customers'
  add_foreign_key 'calls', 'users'
end
