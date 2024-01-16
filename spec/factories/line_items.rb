# spec/factories/line_items.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :line_items do
    association :product
    association :user
    quantity { 1 }
  end
end