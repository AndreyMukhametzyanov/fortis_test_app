# frozen_string_literal: true

class Chef < ApplicationRecord
  has_many :recipes, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :bio, length: { maximum: 1000 }, allow_blank: true
end
