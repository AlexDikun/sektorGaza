# app/models/categorization.rb
# frozen_string_literal: true

class Categorization < ApplicationRecord
  belongs_to :category
  belongs_to :product

  validates :category_id, presence: true, uniqueness: { scope: :product_id }
  validates :product_id, presence: true, uniqueness: { scope: :category_id }
end
