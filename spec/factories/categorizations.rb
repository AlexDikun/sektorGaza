# spec/factories/categorizations.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :categorization do
    association :category
    association :product
  end
end
