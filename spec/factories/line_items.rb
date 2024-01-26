# spec/factories/line_items.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    association :product
    association :cart
    quantity { 1 }
  end
end
