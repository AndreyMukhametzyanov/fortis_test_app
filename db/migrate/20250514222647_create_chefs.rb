# frozen_string_literal: true

class CreateChefs < ActiveRecord::Migration[7.1]
  def change
    create_table :chefs do |t|
      t.string :name
      t.text :bio

      t.timestamps
    end
  end
end
