# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# app/models/line_item.rb
# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true, uniqueness: { scope: :product_id }
  validates :quantity, numericality: { other_than: 0 }, presence: true
end
