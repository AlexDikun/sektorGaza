# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(1)
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#

# app/models/line_item.rb
# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :product_id, presence: true, uniqueness: { scope: :cart_id }
  validates :cart_id, presence: true, uniqueness: { scope: :product_id }
  validates :quantity, numericality: { other_than: 0 }, presence: true

  def total_price
    quantity * product.price
  end
end
