# frozen_string_literal: true

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
#  order_id   :bigint
#
# spec/factories/line_items.rb

FactoryBot.define do
  factory :line_item do
    association :product
    association :cart
    quantity { 1 }
  end
end
