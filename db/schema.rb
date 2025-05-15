# frozen_string_literal: true

ActiveRecord::Schema[7.1].define(version: 20_250_514_222_656) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'chefs', force: :cascade do |t|
    t.string 'name'
    t.text 'bio'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'name'
    t.text 'ingredients'
    t.text 'instructions'
    t.bigint 'chef_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['chef_id'], name: 'index_recipes_on_chef_id'
  end

  add_foreign_key 'recipes', 'chefs'
end
