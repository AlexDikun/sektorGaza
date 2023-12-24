# frozen_string_literal: true

# == Schema Information
#
# Table name: categorizations
#
#  id          :bigint           not null, primary key
#  category_id :integer
#  product_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# app/models/categorization.rb
# frozen_string_literal: true

class Categorization < ApplicationRecord
  belongs_to :category
  belongs_to :product

  validates :category_id, presence: true, uniqueness: { scope: :product_id }
  validates :product_id, presence: true, uniqueness: { scope: :category_id }
end
