# spec/factories/carts.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :cart do
    association :user
  end
end
