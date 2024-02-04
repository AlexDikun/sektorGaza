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

ActiveRecord::Schema.define(version: 20_240_204_152_344) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'carts', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_carts_on_user_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'categorizations', force: :cascade do |t|
    t.integer 'category_id'
    t.integer 'product_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[category_id product_id], name: 'index_categorizations_on_category_id_and_product_id', unique: true
  end

  create_table 'jwt_denylist', force: :cascade do |t|
    t.string 'jti', null: false
    t.datetime 'expired_at', null: false
    t.index ['jti'], name: 'index_jwt_denylist_on_jti'
  end

  create_table 'line_items', force: :cascade do |t|
    t.integer 'quantity', default: 1
    t.integer 'product_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'cart_id'
    t.bigint 'order_id'
    t.index ['order_id'], name: 'index_line_items_on_order_id'
    t.index %w[product_id cart_id], name: 'index_line_items_on_product_id_and_cart_id', unique: true
  end

  create_table 'orders', force: :cascade do |t|
    t.string 'name'
    t.string 'telephone_number'
    t.text 'address'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.decimal 'price'
    t.text 'image_data'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'reviews', force: :cascade do |t|
    t.text 'content', default: '', null: false
    t.integer 'rating', null: false
    t.bigint 'user_id', null: false
    t.bigint 'product_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['product_id'], name: 'index_reviews_on_product_id'
    t.index %w[user_id product_id], name: 'index_reviews_on_user_id_and_product_id', unique: true
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'fullname'
    t.text 'avatar_data'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'carts', 'users'
  add_foreign_key 'categorizations', 'categories'
  add_foreign_key 'categorizations', 'products'
  add_foreign_key 'line_items', 'carts'
  add_foreign_key 'line_items', 'orders'
  add_foreign_key 'line_items', 'products'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'reviews', 'products'
  add_foreign_key 'reviews', 'users'
end
