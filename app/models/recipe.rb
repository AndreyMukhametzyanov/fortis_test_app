# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :chef

  validates :name, presence: true, length: { maximum: 150 }
  validates :ingredients, presence: true
  validates :instructions, presence: true
end
